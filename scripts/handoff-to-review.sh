#!/usr/bin/env bash

# Atomic writer -> reviewer handoff. Replaces the manual "edit meta, mv folder"
# steps so a writer session cannot finish drafting without the state transition
# landing.
#
# Usage: handoff-to-review.sh <job-slug>
# JOBS_ROOT (env): pipeline root, default ./upwork-jobs
#
# Does, in order:
#   1. locate the case in drafting/ or review/
#   2. find the highest proposal-vN.md / loom-script-vN.md pair (must match)
#   3. sanity-check the drafts are complete (non-empty; loom has Key terms;
#      no bracketed block labels left in the paste body)
#   4. set meta.yaml: status: awaiting_review, round: N, updated_at: now
#   5. move drafting/<slug> -> review/<slug> if needed
#   6. verify the final state and print it
# Fails loudly (non-zero exit) on any inconsistency. Idempotent: safe to re-run
# to repair a torn handoff.

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <job-slug>" >&2
  exit 1
fi

slug="$1"
jobs="${JOBS_ROOT:-./upwork-jobs}"
drafting="$jobs/drafting/$slug"
review="$jobs/review/$slug"

if [[ -d "$drafting" && -d "$review" ]]; then
  echo "ERROR: $slug exists in BOTH drafting/ and review/ — resolve the duplicate first." >&2
  exit 1
elif [[ -d "$drafting" ]]; then
  case_dir="$drafting"
elif [[ -d "$review" ]]; then
  case_dir="$review"
else
  echo "ERROR: no case folder for '$slug' in $jobs/drafting/ or $jobs/review/." >&2
  exit 1
fi

# Highest proposal version
n=0
for f in "$case_dir"/proposal-v*.md; do
  [[ -e "$f" ]] || continue
  v="${f##*/proposal-v}"; v="${v%.md}"
  [[ "$v" =~ ^[0-9]+$ ]] && (( v > n )) && n="$v"
done
if (( n == 0 )); then
  echo "ERROR: no proposal-v*.md in $case_dir — nothing to hand off." >&2
  exit 1
fi

proposal="$case_dir/proposal-v$n.md"
loom="$case_dir/loom-script-v$n.md"

if [[ ! -s "$proposal" ]]; then
  echo "ERROR: $proposal is missing or empty." >&2
  exit 1
fi
if [[ ! -s "$loom" ]]; then
  echo "ERROR: loom-script-v$n.md is missing or empty — versions must match (found proposal-v$n.md). If the strategy has no Loom, the file must still exist and say 'No Loom for this job' with the reason." >&2
  exit 1
fi
if ! grep -qi "key terms\|no loom" "$loom"; then
  echo "ERROR: $loom has no 'Key terms to practice' section — the draft looks unfinished." >&2
  exit 1
fi

# Ending format check (proposal-writing.md). The paste body must END WITH THREE
# PLAIN PARAGRAPHS in order: track record, work mode, risk reversal. The
# "[Track record: ...]" labels are internal structure only; a literal label or
# its square brackets left in the paste body is a hard fail. Shape problems in
# the three paragraphs are WARN, because their wording is rewritten per job.
python3 - "$proposal" <<'PY' || exit 1
import re, sys

path = sys.argv[1]
text = open(path, encoding="utf-8").read()

errors, warns = [], []

start = re.search(r'^#+ *PASTE THIS INTO UPWORK.*$', text, re.M)
end = re.search(r'^#+ *PASTE ENDS HERE.*$', text, re.M)
scoped = bool(start and end and end.start() > start.end())
body = text[start.end():end.start()] if scoped else text
if not scoped:
    warns.append("no 'PASTE THIS INTO UPWORK' / 'PASTE ENDS HERE' markers — "
                 "scanned the whole file for labels and skipped the three-paragraph ending check")

seen = set()
for m in re.finditer(r'\[\s*(track record|work mode|risk reversal|experience|ending)\s*[:\]]', body, re.I):
    label = m.group(1).lower()
    if label in seen:
        continue
    seen.add(label)
    errors.append("literal '%s' label in the paste body — the ending must render as three "
                  "plain paragraphs with no labels and no square brackets (proposal-writing.md). "
                  "Delete the label and the brackets, keep the sentences." % m.group(0).strip())

if re.search(r'[—–]', body):
    errors.append("em dash or en dash inside the paste body — plain text rule (proposal-writing.md)")
if re.search(r'\*\*', body):
    errors.append("markdown bold inside the paste body — plain text rule (proposal-writing.md)")

if scoped:
    words = len(body.split())
    if words > 150:
        warns.append("paste body is %d words; the cap is 150" % words)
    paras = [p.strip() for p in re.split(r'\n[ \t]*\n', body) if p.strip()]
    if len(paras) < 4:
        warns.append("paste body has fewer than 4 paragraphs — the three fixed ending "
                     "paragraphs plus the opening should all be there")
    else:
        track, mode, risk = paras[-3:]
        for name, p in (("track record", track), ("work mode", mode), ("risk reversal", risk)):
            if re.match(r'[-*#>]|\d+\.', p.lstrip()):
                warns.append("the %s paragraph is a bullet or heading, not a plain paragraph" % name)
        if not re.search(r'\d', track):
            warns.append("3rd-from-last paragraph has no number — the Track record block should "
                         "carry the outcome number from the user's profile (or the identity line if no row matches)")
        if not re.search(r"(don'?t|does\s*n'?t|do not|does not|won'?t|will not)\s+\w*\s*(pay|charge)"
                         r"|no charge|for free|is free|refund|we stop|step aside|money back", risk, re.I):
            warns.append("last paragraph does not look like the Risk reversal block "
                         "(expected a bounded first milestone with no-pay / no-charge / we-stop wording)")

for w in warns:
    print("WARN: %s: %s" % (path, w), file=sys.stderr)
for e in errors:
    print("ERROR: %s: %s" % (path, e), file=sys.stderr)
sys.exit(1 if errors else 0)
PY

# Update meta.yaml
timestamp="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
python3 - "$case_dir/meta.yaml" "$n" "$timestamp" <<'PY'
import re, sys
path, n, ts = sys.argv[1], sys.argv[2], sys.argv[3]
s = open(path).read()
s = re.sub(r'^status: .*$', 'status: awaiting_review', s, flags=re.M)
s = re.sub(r'^round: .*$', f'round: {n}', s, flags=re.M)
s = re.sub(r'^updated_at: .*$', f'updated_at: "{ts}"', s, flags=re.M)
open(path, 'w').write(s)
PY

# Move to review/ if still in drafting/
if [[ "$case_dir" == "$drafting" ]]; then
  mkdir -p "$jobs/review"
  mv "$drafting" "$review"
  case_dir="$review"
fi

# Final verification
[[ -d "$review" ]] || { echo "ERROR: move failed — $review does not exist." >&2; exit 1; }
grep -q "status: awaiting_review" "$review/meta.yaml" || { echo "ERROR: meta.yaml not updated." >&2; exit 1; }

echo "HANDOFF OK: $review  (round: $n, status: awaiting_review)"
ls "$review"
