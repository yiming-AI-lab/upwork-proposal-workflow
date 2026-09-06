#!/usr/bin/env python3
"""Transpose an existing Excalidraw layout without changing its semantics."""

from __future__ import annotations

import argparse
import copy
import hashlib
import json
import sys
from pathlib import Path


VOLATILE = {"x", "y", "width", "height", "angle", "points", "updated", "version", "versionNonce", "lastCommittedPoint"}


def is_baseline(value: object, expected: str) -> bool:
    return isinstance(value, str) and value == expected


def semantic_element(element: dict, baseline: str) -> dict:
    item = copy.deepcopy(element)
    for key in VOLATILE:
        item.pop(key, None)
    for binding_name in ("startBinding", "endBinding"):
        binding = item.get(binding_name)
        if isinstance(binding, dict):
            binding.pop("fixedPoint", None)
    for key in ("text", "rawText", "originalText"):
        if is_baseline(item.get(key), baseline):
            item[key] = "<BASELINE>"
    return item


def fingerprint(document: dict, baseline: str) -> str:
    elements = [semantic_element(item, baseline) for item in document.get("elements", [])]
    payload = json.dumps(elements, ensure_ascii=False, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(payload.encode("utf-8")).hexdigest()


def map_point(x: float, y: float, min_x: float, min_y: float, branch_scale: float) -> tuple[float, float]:
    return 80 + (y - min_y) * branch_scale, 80 + (x - min_x)


def transform(document: dict, old_baseline: str, new_baseline: str, branch_scale: float) -> dict:
    result = copy.deepcopy(document)
    elements = [item for item in result.get("elements", []) if not item.get("isDeleted")]
    non_lines = [item for item in elements if item.get("type") not in {"arrow", "line"}]
    if not non_lines:
        raise ValueError("no visible non-line elements")

    centers = [
        (float(item.get("x", 0)) + float(item.get("width", 0)) / 2,
         float(item.get("y", 0)) + float(item.get("height", 0)) / 2)
        for item in non_lines
    ]
    min_x = min(x for x, _ in centers)
    min_y = min(y for _, y in centers)

    baseline_hits = 0
    for item in elements:
        if item.get("type") in {"arrow", "line"}:
            old_points = item.get("points") or [[0, 0], [item.get("width", 0), item.get("height", 0)]]
            absolute = [
                (float(item.get("x", 0)) + float(point[0]), float(item.get("y", 0)) + float(point[1]))
                for point in old_points
            ]
            mapped = [map_point(x, y, min_x, min_y, branch_scale) for x, y in absolute]
            origin_x, origin_y = mapped[0]
            relative = [[round(x - origin_x, 3), round(y - origin_y, 3)] for x, y in mapped]
            item["x"], item["y"] = round(origin_x, 3), round(origin_y, 3)
            item["points"] = relative
            item["width"] = round(max(x for x, _ in relative) - min(x for x, _ in relative), 3)
            item["height"] = round(max(y for _, y in relative) - min(y for _, y in relative), 3)
            for binding_name in ("startBinding", "endBinding"):
                binding = item.get(binding_name)
                if isinstance(binding, dict) and isinstance(binding.get("fixedPoint"), list):
                    fx, fy = binding["fixedPoint"]
                    binding["fixedPoint"] = [fy, fx]
        else:
            width = float(item.get("width", 0))
            height = float(item.get("height", 0))
            center_x = float(item.get("x", 0)) + width / 2
            center_y = float(item.get("y", 0)) + height / 2
            mapped_x, mapped_y = map_point(center_x, center_y, min_x, min_y, branch_scale)
            item["x"] = round(mapped_x - width / 2, 3)
            item["y"] = round(mapped_y - height / 2, 3)

        for key in ("text", "rawText", "originalText"):
            if is_baseline(item.get(key), old_baseline):
                item[key] = new_baseline
                baseline_hits += 1

    if baseline_hits == 0:
        raise ValueError(f"baseline not found: {old_baseline!r}")
    return result


def run(source: Path, destination: Path, old_baseline: str, new_baseline: str, branch_scale: float) -> tuple[str, str]:
    document = json.loads(source.read_text(encoding="utf-8"))
    before = fingerprint(document, old_baseline)
    result = transform(document, old_baseline, new_baseline, branch_scale)
    after = fingerprint(result, new_baseline)
    if before != after:
        raise ValueError(f"semantic fingerprint changed: {before} != {after}")
    destination.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    return before, after


def self_test() -> int:
    import tempfile

    baseline_old = "SCOPE-X / PLAN-X draft"
    baseline_new = "SCOPE-X / PLAN-X r2"
    sample = {
        "type": "excalidraw",
        "elements": [
            {"id": "a", "type": "rectangle", "x": 0, "y": 0, "width": 100, "height": 50, "text": None},
            {"id": "t", "type": "text", "x": 0, "y": 0, "width": 100, "height": 20, "text": baseline_old, "originalText": baseline_old},
            {"id": "b", "type": "rectangle", "x": 300, "y": 0, "width": 100, "height": 50},
            {"id": "e", "type": "arrow", "x": 100, "y": 25, "width": 200, "height": 0, "points": [[0, 0], [200, 0]], "startBinding": {"elementId": "a", "fixedPoint": [1, .5]}, "endBinding": {"elementId": "b", "fixedPoint": [0, .5]}},
        ],
    }
    with tempfile.TemporaryDirectory() as directory:
        source = Path(directory) / "in.excalidraw"
        output = Path(directory) / "out.excalidraw"
        source.write_text(json.dumps(sample), encoding="utf-8")
        before, after = run(source, output, baseline_old, baseline_new, 3.0)
        result = json.loads(output.read_text(encoding="utf-8"))
    arrow = next(item for item in result["elements"] if item["type"] == "arrow")
    if before != after or abs(arrow["height"]) <= abs(arrow["width"]):
        print("SELF-TEST ERROR: semantic or orientation validation failed")
        return 1
    print("OK: layout transposed and semantic fingerprint preserved")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("source", nargs="?", type=Path)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--in-place", action="store_true")
    parser.add_argument("--from-baseline")
    parser.add_argument("--to-baseline")
    parser.add_argument("--branch-scale", type=float, default=3.0)
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if args.self_test:
        return self_test()
    if not args.source or not args.from_baseline or not args.to_baseline:
        parser.error("source, --from-baseline, and --to-baseline are required")
    if args.in_place == bool(args.output):
        parser.error("choose exactly one of --in-place or --output")
    destination = args.source if args.in_place else args.output
    try:
        before, after = run(args.source, destination, args.from_baseline, args.to_baseline, args.branch_scale)
    except (OSError, ValueError, json.JSONDecodeError) as error:
        print(f"ERROR: {error}")
        return 1
    print(f"OK: semantic fingerprint preserved {before}; output={destination}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
