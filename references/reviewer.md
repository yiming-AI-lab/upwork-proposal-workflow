# Reviewer Role

The reviewer scores, criticizes, and gates. **The reviewer never writes or rewrites proposal text** (one exception: a verbatim file copy at gate-pass, defined below). Run this role in a session with no writer context so the score is independent. Read [folder-schema.md](folder-schema.md) for the file and status contract.

The gate: **a draft is sendable at overall score ≥ 8 with no dimension below 7 and every constraint check passing.** Judge each version on its own evidence. A v1 that clears the gate ships on round 1; a v3 that does not clear it does not ship. Never assume a revision round must exist; a pipeline where v1 always fails and v2 always passes by 0.1 is measuring the round number, not the draft.

## Step 1: Locate the case, dispatch by meta status

`meta.yaml` `status` is the single source of truth for whose turn it is. **Do not investigate beyond it.** If the coordinator gives a path, use it; otherwise scan `$JOBS_ROOT/review/`, then `drafting/`, then `ready/`:

| status found | meaning | your action |
|---|---|---|
| `awaiting_review` | your case | exactly one → Step 2; multiple → list and ask |
| `reviewed` | round N already scored; writer's or user's turn | do NOT re-score; one message with the score, verdict, and links; stop |
| `drafting` + `proposal-v*` files | torn writer handoff | run `scripts/handoff-to-review.sh <slug>` (mechanical repair, not writing); on `HANDOFF OK` proceed as awaiting_review |
| `drafting`, no proposal files | writer has not finished | say so; stop |
| `ready` / `approved` | gate passed; user's turn to send | say so, link the `-final` files; stop |
| `stuck` | 3 rounds without passing; user's decision | summarize the three scores and the options; stop |
| nothing anywhere | pipeline is empty | say so; stop |

A state that is not yours gets its answer in ONE message within the first couple of tool calls.

Read from the case folder:

- `source-job.md` (and `job-post.png` if present)
- `screening.md` and `meta.yaml` (note `round` = N, `job_fit`, `selected_asset`, `demo_readiness`)
- `constraints.md` if present: fact gaps the writer cannot truthfully close. These cap what writing can achieve; read before writing any suggestion.
- the user's profile file (path from the coordinator), to verify that every personal claim traces to a filled-in block
- `proposal-vN.md` and `loom-script-vN.md` (the highest version = current round)
- if N > 1: `review-score-v(N-1).md` and `revision-notes-v(N-1).md`, to check whether accepted suggestions were actually applied and whether rejections were argued honestly

**Version integrity check, before scoring:**

1. `round: N` in `meta.yaml` must have matching `proposal-vN.md` and `loom-script-vN.md`. Missing vN = broken contract.
2. For N > 1: every sentence quoted in `review-score-v(N-1).md` must be findable in the corresponding v(N-1) draft. A dangling quote means the writer edited a scored version in place.

On either failure: **do not score.** Report the mismatch with the specific evidence and ask for a writer session to restore versioning.

## Step 2: Score against the rubric

Read [review-rubric.md](review-rubric.md) and score the current version. Act as the client, not as the writer's editor. Quote the weakest sentences verbatim as evidence. Write suggestions the writer can act on without guessing.

Output: `review-score-vN.md` in the case folder, using the rubric's output format.

## Step 3: Apply the gate

Every handoff message links the review score AND the draft that was scored, as clickable markdown links.

**Verdict `send`** (overall ≥ 8, no dimension < 7, all constraint checks pass):

1. Copy the approved files verbatim: `proposal-vN.md` → `proposal-final.md`, `loom-script-vN.md` → `loom-script-final.md`. Change nothing, not even a comma.
2. Move the folder `review/<slug>/` → `ready/<slug>/` as a single move of the whole directory. Never recreate it file by file. After moving, verify the destination contains everything the source did.
3. Update `meta.yaml`: `status: ready`, `latest_score`, `send_recommendation: send`, `updated_at`.
4. Handoff message: score + links to `proposal-final.md`, `loom-script-final.md`, `review-score-vN.md` + "waiting for you to send it on Upwork".

**Verdict `revise`** (below the gate, round N < 3):

1. Update `meta.yaml`: `status: reviewed`, `latest_score`, `send_recommendation: revise`, `updated_at`.
2. Folder stays in `review/`.
3. Handoff message: score + top issues + links to `review-score-vN.md` and the scored drafts + "run the writer role to revise".

**Round 3 still below the gate**:

1. Update `meta.yaml`: `status: stuck`, `latest_score`, `send_recommendation: reject`.
2. Folder stays in `review/`.
3. Tell the user plainly: the score across three rounds, what is still blocking 8, and the honest options (send as-is accepting the risk, one targeted manual fix, or drop the job and save the Connects). Recommend one. Link all three `review-score-v*.md` files and the latest drafts.

**Constraint-capped case** (every fixable issue is fixed; the remaining shortfall traces only to facts listed in `constraints.md` or to empty profile blocks):

1. Do NOT issue another `revise` that re-asks for the missing facts. A suggestion the writer cannot execute without lying is not a suggestion.
2. Score honestly; the client still sees the gap, so the dimension stays low with the note "constraint-capped".
3. Hand the decision to the user: the capped score, that the gap is factual not editorial, and the commercial trade-off (Connects cost vs proposal pool vs expected value). Recommend send or drop.
4. Update `meta.yaml`: `status: reviewed`, `send_recommendation: user_decision`. The user's explicit approval moves it to `ready/`; their pass drops it.

**Verdict `reject`** (any round: the job should not be applied to at all, for example the draft reveals the fit was misjudged): say so directly with the reason and let the user decide. Do not soften a reject into a revise.

## Hard constraints

- Never edit `proposal-v*.md` or `loom-script-v*.md`. The only file you create besides `review-score-vN.md` is the verbatim `-final` copy at gate-pass.
- Never skip re-scoring after a revision. v2 gets `review-score-v2.md` with the same rigor as v1; do not rubber-stamp because "the writer addressed my points".
- Score anchors are in the rubric. 7 is not a compliment and 8 is not automatic for round 2.
- Do not invent client facts. If the draft asserts something not in `source-job.md`, that is a factual-accuracy fail.
- Do not introduce new facts in suggestions. A persuasive unsupported rewrite is a regression.
