# Folder Schema

Shared contract between the writer, reviewer, and archiver roles. All three read this same schema; if you change it, change it for all.

## Pipeline root

```text
$JOBS_ROOT/<stage>/<job-slug>/
```

`JOBS_ROOT` is an environment variable read by the scripts; default `./upwork-jobs` relative to the working directory. The user may set it to any folder outside the skill. Never store cases inside the skill folder.

| Stage | Meaning | Who moves a case IN |
|---|---|---|
| `drafting/` | writer is producing v1 | writer (`scripts/init-job-case.sh`) |
| `review/` | review loop runs here across all rounds | writer, via `scripts/handoff-to-review.sh`, when v1 is complete |
| `ready/` | passed the reviewer gate, waiting for the user to send | reviewer, on verdict `send` (or explicit user override) |
| `submitted/` | user confirmed it was sent on Upwork | archiver |

There are exactly **three folder moves** in a case's life. During the review loop the folder stays in `review/`. Rounds are expressed by filenames and `meta.yaml`, never by moving files. No relay folders, no file copying between stages.

## Files

```text
<job-slug>/
├── meta.yaml               # single source of truth for state
├── source-job.md           # original job text, never summarized
├── job-post.png            # screenshot when available
├── screening.md            # writer's screening report (facts, essence, recommendation)
├── constraints.md          # fact gaps the writer cannot truthfully close (only when needed)
├── proposed-architecture.excalidraw  # writer's diagram for the Loom when no demo is selected (or .md with Mermaid, labeled Not rendered)
├── proposal-v1.md          # writer, round 1
├── loom-script-v1.md       # writer, round 1 (or "No Loom for this job" + reason)
├── review-score-v1.md      # reviewer, round 1
├── revision-notes-v1.md    # writer's response to review round 1
├── proposal-v2.md          # writer, round 2
├── loom-script-v2.md       # writer, round 2
├── review-score-v2.md      # reviewer, round 2
├── ...                     # up to round 3
├── proposal-final.md       # created by the REVIEWER at gate-pass: verbatim copy of the approved vN
└── loom-script-final.md    # same
```

Files are created by the step that produces them. Do not pre-create empty files. `-final` files are mechanical copies of the approved version, made by the reviewer so the archive step never has to guess which vN won.

`proposal-vN.md` layout: a `## PASTE THIS INTO UPWORK` heading, the plain-text body, a `## PASTE ENDS HERE` heading, then any notes for the user (screening-question answers, reminders). The handoff script checks the body between the two headings.

## `meta.yaml`

```yaml
job_id: ""
title: ""
slug: ""
url: ""
status: drafting # drafting / awaiting_review / reviewed / approved / stuck / ready / submitted
round: 0 # current review round, 1-3
latest_score: "" # reviewer's most recent overall score, e.g. "7.4"
created_at: ""
updated_at: ""
source_type: "" # url / pasted / screenshot / file
screening_recommendation: "" # apply / skip / uncertain
screening_reason: ""
screened_at: ""
screening_confirmed_by_user: false
job_fit: "" # person-fit / deliverable-fit / design-first / mixed
selected_asset: "" # loom / diagram / demo:<name> / case-study:<name> / none
demo_readiness: "" # AVAILABLE / BUILD OPPORTUNITY / NOT NEEDED / PLANNED
demo_reason: ""
client_industry: "" # read off the job description only; "unknown" is valid, a guess is worse than unknown
problem_type: "" # build-new / rescue-audit / fix-debug / integrate / migrate / ongoing-ops / advisory / unknown
writer: upwork-proposal-workflow/writer
reviewer: upwork-proposal-workflow/reviewer
send_recommendation: "" # reviewer's latest verdict: send / revise / reject / user_decision
submitted: false
submitted_date: ""
```

### Status transitions

```text
drafting          writer is working on v1 (folder in drafting/)
awaiting_review   writer finished vN; reviewer's turn (folder in review/)
reviewed          reviewer scored vN with verdict revise or user_decision; writer's or user's turn (folder in review/)
approved          reviewer verdict send; reviewer moves folder to ready/ and sets status: ready
stuck             round 3 scored and still below the gate; user decides
ready             in ready/, waiting for the user to actually send
submitted         archived under submitted/
```

Whoever changes `status` also updates `updated_at`, `round`, `latest_score`, and `send_recommendation` as applicable.

## Slug rules

- lowercase, hyphens, human-readable
- prefer the job title over a random number
- append the job id only to disambiguate
