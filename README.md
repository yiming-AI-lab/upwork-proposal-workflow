# Upwork Proposal Workflow

[MIT licensed](LICENSE).

A portable agent skill that runs a three-role proposal pipeline for one already-found Upwork job: a **writer** screens and drafts, an **independent reviewer** in a fresh session scores against a rubric and gates, the loop revises up to three rounds, and an **archiver** records what was actually sent. The user decides whether to apply and always submits manually.

## Install

### Codex

Copy the `upwork-proposal-workflow` folder into your Codex skills directory, then invoke:

```text
$upwork-proposal-workflow
```

The included `agents/openai.yaml` configures the Codex display name, default prompt, and explicit-only invocation policy.

### Claude Code

Copy the entire folder to:

```text
.claude/skills/upwork-proposal-workflow/
```

Then ask Claude Code to use `upwork-proposal-workflow` on one pasted job post, screenshot, or job URL. Claude can ignore `agents/openai.yaml`; the workflow lives in `SKILL.md`, `references/`, `scripts/`, and the bundled `skills/`.

### Other agents

If the agent supports skills, place the folder in its documented skills directory. Otherwise instruct it to read `SKILL.md` completely and follow the role files in `references/` when each stage requires them. If the agent cannot open sub-sessions, the coordinator tells you which role to run next in a new session; the case state lives on disk, so any session can pick up from `meta.yaml`.

## Setup (once)

Before the first job the workflow needs your profile at `./upwork-jobs/profile.md` (or wherever `JOBS_ROOT` / `PROFILE_FILE` point). Two ways to create it, pick one:

1. **Interview**: ask the skill to set you up; it interviews you in short batches and writes the file.
2. **Template**: copy `templates/freelancer-profile.md` there and fill it in; every block carries instructions.

Either way it ends with a list of the blocks you left blank and what each blank costs. After that, **no job run asks about your background, demos, rates, or voice**; the writer works from the file and records gaps for the reviewer. The only per-job question the writer may ask is a fact a screening question demands and the profile does not hold.

## How it runs

```text
input → writer: screen → [you: apply / skip] → writer: case + v1 → reviewer (new session): score
      → send? → deliver to you → [you submit] → archiver
      → revise? → writer: v(N+1) → reviewer (new session) ... up to round 3
```

- Cases live under `JOBS_ROOT` (default `./upwork-jobs`), in `drafting/ → review/ → ready/ → submitted/`. `meta.yaml` is the single source of truth; drafts and reviews are versioned files (`proposal-v1.md`, `review-score-v1.md`, ...). See `references/folder-schema.md`.
- `scripts/init-job-case.sh` creates a case; `scripts/handoff-to-review.sh` is the only way a draft moves to review (it checks the files and the plain-text rules, then flips the state).
- The gate: overall ≥ 8, no dimension below 7, all constraint checks passing. See `references/review-rubric.md`.
- Proposal rules (first 150 characters, 80 to 150 words, outcome numbers only, three-paragraph ending) are in `references/proposal-writing.md`; Loom rules (five beats, about two minutes) in `references/loom-visual.md`.

## Portability

- No personal profile, portfolio, private path, credential, or external account is bundled.
- The proposal ending (track record row, identity line, work mode, risk reversal) and the Loom's social-proof beat are built from blocks in your profile, filled once at setup. The skill ships only the blank template and never supplies those facts; an empty block is worked around, never invented.
- The demo inventory ships empty and demos are optional. If you list demos in your profile (with a status and a keyword table), `references/demo-selection.md` picks and presents one; with none, the same file defines the no-demo path (diagram or text giveaway as the asset, implementation judgment as proof). Every screening still shows `Demo Readiness`.
- During setup you may hand the interview an existing Upwork profile, résumé, capability brief, or case-study folder to draw from; it still writes only what you confirm.
- No model names are hard-coded. Give the reviewer a model at least as capable as the writer's, and never let it run in the writer's session.
- No MCP server or platform-specific API is required. The scripts need bash and python3.
- **Diagrams**: the package bundles `skills/excalidraw-flowchart/`, which draws an editable `.excalidraw` file through `npx @swiftlysingh/excalidraw-cli` (Node.js required, nothing installed permanently). When you have no demo for a job, the writer draws a `Proposed Architecture` diagram with it and the Loom walks that diagram. Without Node.js the workflow falls back to Mermaid labeled `Not rendered`. You may also copy `skills/excalidraw-flowchart/` into your agent's skills directory to use it on its own.
- Every proposal comes with a Loom script by default (five beats, about two minutes); you record it yourself and paste the link. Opt out per job if you do not want one.
- The skill prepares application materials but never submits an application or spends Connects.

## Typical prompts

```text
Use $upwork-proposal-workflow to set up my profile (interview mode).
```

```text
Use $upwork-proposal-workflow on this job: <URL or pasted post>.
```

```text
Use $upwork-proposal-workflow, reviewer role only, on ./upwork-jobs/review/<slug>/.
```

```text
Use $upwork-proposal-workflow, archiver role: I sent the proposal for <slug>. Here is the as-sent text and the Loom transcript.
```
