# Review Rubric

The reviewer is a proxy for the client, not the writer's editor. The scoring apparatus (four dimensions, 1 to 10 scale, anchors, the ≥8 gate) is a handoff device between writer and reviewer sessions, not ground truth; the market's reply rate outranks any score here.

## Reviewer goal

One question: if the client receives 20 to 50 proposals, does THIS one make them click "Reply"?

Background math: in a 35-proposal pool roughly 20% are serious, so the real competition is 3 to 7 people. The question is never "is this proposal good" but "does this beat the other 5 serious ones".

## Funnel premise

This rubric optimizes what happens AFTER the proposal is viewed. The Loom has nothing to do with whether the proposal gets viewed; it is what happens after. If the user reports proposals going unviewed, the bottleneck is the profile, the first 150 characters, boosting, or job selection, not draft quality. Do not demand more rewrite rounds; flag the funnel stage instead.

## Score anchors (read before scoring)

Scores that cluster at 7.0 to 7.4 for every draft are meaningless. Use these anchors:

- **5, template.** Could be sent to any job in this category. Client skims past it.
- **6, competent but generic.** Understands the job, proves nothing specific. Blends into the pool.
- **7, solid, forgettable.** Correct structure, relevant proof, zero surprise. Client might reply if the serious competition is weak. **7 is the default for a well-executed template. It is not praise.**
- **8, reply-worthy.** At least one moment where the client thinks "this person actually read my post / already solved my risky part". Beats most serious competitors.
- **9, top of the pool.** Client-specific insight + front-loaded proof + zero-friction next step, all three landing. Client shortlists it immediately.
- **10, do not use.**

**For every dimension you score below 8, write one sentence describing what the 9 version of that dimension would contain for THIS job.** This forces the gap to be concrete and gives the writer a target.

## Anti-anchoring rules

- **Dimensions first, verdict last.** Score all four dimensions with quoted evidence BEFORE forming any verdict; overall = the arithmetic mean of the four (show the arithmetic). Never choose the verdict first and back-fill numbers toward the gate.
- **All outcomes must be live.** A v1 can pass on round 1. A revision can score LOWER than the previous round. A v2 can stay below 8. If none of these ever happens across cases, the scoring is broken.
- **"The writer applied my suggestions" adds zero points by itself.** Re-read the new draft as a first-time client seeing it cold; score only what is on the page.
- **Self-check before saving**: if the score lands within 0.2 of the gate on the passing side at round ≥ 2, re-derive it from the dimension quotes once more. Gate-hugging is the signature of narrative scoring.

## Score dimensions (1 to 10 each)

### 1. Problem identification

- Does it identify the client's real problem and buying trigger, or paraphrase the job post?
- Person-fit jobs: does it hit the client's actual filtering criteria (hours, timezone, platforms, QA, independence)?
- Would the client feel "this person gets what I actually need"?

### 2. Proof relevance

- Does the proof directly map to the client's core risk, or is it "here's my system"?
- **Person-fit check**: the proof must be about how the person works (process, QA, reliability, platform match). A demo walkthrough as the main proof caps at 6; the client is hiring a person, not buying that workflow.
- **Deliverable-fit check**: the demo or proof must map to the risky part of THEIR build, not the impressive part of ours.
- **Design-first check**: the proposal names ONE expensive decision from their post without solving it; proof is the architecture diagram walkthrough, not a canvas or code. A draft that sketches their data model in the text, or shows a build in the Loom, caps at 6.

### 3. Differentiation

- Remove the name: can this be told apart from the other serious proposals?
- Is there at least one client-specific insight not derivable from a template (a contradiction spotted, an unstated constraint, a named failure mode of their workflow)? Deliverable-fit drafts without one cap at 7.
- Does the Loom show something a text proposal cannot? Beat 4 must open ONE flow and walk it (input to output); a zoomed-out canvas tour or a screenshot caps at 6.
- Loom beats per [loom-visual.md](loom-visual.md): hello + name + live interaction on their post (0 to 10s); social proof under 10s, outcome number not inventory count; the gift promised out loud by 30s; close has gift repeated + retainer intent + online-now. Missing the spoken gift promise or the retainer line: minus 1 each.

### 4. Trust and next step

- Social proof front-loaded? The strongest outcome number must appear in the proposal's first half and the Loom's first 20 seconds. Credential buried at the bottom only caps at 7.
- Is the next step zero-friction and specific ("send me one sample email", "I can take the first workflow this week"), not "let's discuss"?
- Risk reversal present and tied to a bounded first milestone, with no self-disqualifying wording ("new to Upwork" = fail)?
- At least one outcome number (money / time / rate) in the first half? Years of experience alone is not social proof. **Inventory counts (N workflows / tables / fields / milestones) anywhere in the proposal or Loom = fail.** Every outcome number must trace to the user's profile blocks or the client's own post. **Blame framing = fail**: any sentence whose point is a previous developer's or vendor's failure; the sellable story is the verification method and the decision it enabled.
- If the user's profile blocks are empty for this job, the dimension is scored honestly and marked "constraint-capped: no outcome row"; do not demand a number the user has not supplied.

## Constraint checks (pass / fail, not scored)

The hard numbers live in [proposal-writing.md](proposal-writing.md) and [loom-visual.md](loom-visual.md); verify against those files, not memory. Summary:

- **format_compliance**: proposal body 80 to 150 words; structure per the job-type shape; every screening question answered or flagged outside the paste body; the ending present as three plain paragraphs. Literal `[Track record:` / `[Work mode:` / `[Risk reversal:` labels or square brackets in the paste body = fail.
- **first_150_chars**: the preview text carries the three signals (paraphrases THEIR ask in their nouns, says this is what the writer does all the time, hands over an asset with the link inside or immediately after the 150 characters). Fail on "Hello / I'm excited / I read your post" openers, on generic industry truisms, on any status-lowering phrase, and on an opening clause reused from the previous case.
- **plain_text_safety**: no markdown bold, no `---` rules, no em or en dashes, no internal notes or reminders inside the paste-able body.
- **loom_speakability**: script 150 to 250 words (above roughly 180 must be justified by job complexity, not padding); simple verbs; has the `## Key terms to practice` list; five beats timestamped; spoken register: no sentence over roughly 18 words, no written-style signposting ("Quick background:", "Quick intro", "In summary,", "Let me introduce"). If a sentence reads like written English, quote it and fail this check. Skip this check when the script says `No Loom for this job`.
- **factual_accuracy**: no overclaims, no client facts absent from `source-job.md`, demo claims consistent with the evidence policy and the user's claim boundaries; Track record block uses a row from the user's profile blocks that matches the job's category, wording not identical to the previous case's ending; no asset link that the user did not supply.
- **proposal_loom_split**: a judgment call, not a string match. Does the Loom re-read the proposal, or show what the text could only describe? Beat 2 says one clause and shows a tab; beat 4 is on-screen proof. Fail only when a viewer who just read the proposal learns nothing new for a stretch of the script; incidental phrase overlap never fails on its own.

Any constraint fail blocks a `send` verdict regardless of score.

## Verdict

- `send`: overall ≥ 8, no dimension < 7, all constraint checks pass.
- `revise`: below the gate, fixable, round < 3.
- **Constraint-only fail at or above the gate**: when the score passes and ONLY constraint checks fail with a fix that changes wording, not substance (a reword, a cut phrase, a moved link), name the exact fix in `main_issues`; the writer applies it and the next reviewer re-checks the named constraints only. This is not a new scored round and never triggers the round-3 stuck path by itself.
- `user_decision`: the only distance to the gate is constraint-capped (see [reviewer.md](reviewer.md)).
- `reject`: the job should not be applied to, or three rounds have not closed the gap.

## Output format (`review-score-vN.md`)

```text
round: N
overall_score: /10
verdict: send / revise / reject / user_decision

scores:
- problem_identification: /10
  what_a_9_looks_like: [required if below 8]
- proof_relevance: /10
  what_a_9_looks_like: [required if below 8]
- differentiation: /10
  what_a_9_looks_like: [required if below 8]
- trust_and_next_step: /10
  what_a_9_looks_like: [required if below 8]

constraint_checks:
- format_compliance: pass / fail
- first_150_chars: pass / fail
- plain_text_safety: pass / fail
- loom_speakability: pass / fail / n.a.
- factual_accuracy: pass / fail
- proposal_loom_split: pass / fail / n.a.

main_issues:
- [what is wrong, quoting the weakest sentence verbatim, and why it costs a reply]

suggestions:
- [specific, actionable change + why it raises reply likelihood]

previous_round_check: [round 2+: were accepted suggestions actually applied? were rejections honestly argued?]

final_note: [one sentence: the single highest-leverage fix]
```

## Fact constraints

If the case folder has a `constraints.md`, read it before writing suggestions.

- A suggestion that requires facts the constraints file rules out is **invalid; do not issue it**, and never re-issue a suggestion the writer already rejected with a constraint reason in an earlier round.
- Score the affected dimension honestly and mark it "constraint-capped: <fact>".
- For a constraint-capped dimension, `what_a_9_looks_like` must describe the best framing achievable **within the facts**, not the missing experience itself.
- When the only distance to the gate is constraint-capped, hand the send/drop decision to the user instead of another revise round.

## Reviewer rules

- Score as the client. Direct criticism over vague politeness.
- Quote evidence. A criticism without a quoted sentence is an opinion.
- Suggestions are recommendations; the writer owns voice and strategy.
- Never rewrite the draft.
- Never add unsupported facts.
- Re-score revisions with full rigor. Round 2 is not graded on effort.
