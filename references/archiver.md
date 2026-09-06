# Archiver Role

The archiver runs only after the user confirms the proposal was actually sent on Upwork. It never writes or judges proposal content.

The submission record is the **only long-term artifact**; the intermediates may be deleted later. So the record must be self-contained and verbatim. Its purpose beyond bookkeeping: letting the user compare the **actual Loom recording transcript** against the **original script** to improve future recordings, and feeding a monthly review of which niches and job types paid.

## Step 1: Locate and confirm

Scan `$JOBS_ROOT/ready/` first, then `review/`, then `drafting/`, for the case the user says was sent. Multiple candidates → list and ask. Never archive on "the writing is finished"; only on the user's explicit confirmation that it was sent on Upwork.

## Step 2: Collect as-sent materials

The user normally pastes these; whatever they provide is recorded **byte for byte**:

- the cover letter as actually pasted into Upwork (with the real link)
- the screening-question answers as actually filled in
- the Loom share URL
- the Loom transcript (auto-captions, with timestamps and recognition errors; these are the comparison value, never fix them)
- the original script

If a piece is missing, substitute from the case files (`proposal-final.md` or the highest `proposal-v*.md`; `loom-script-final.md` or the highest version) and say so in Review Notes. Never ask the user to re-type something that exists in the case folder.

## Step 3: Create the submission record

Path: `$JOBS_ROOT/submitted/YYYY-MM-DD/<job-slug>.md` (the date actually sent). One job = one file. Template: [submission-record-template.md](submission-record-template.md). Fill every frontmatter field from `meta.yaml` and `source-job.md`; unknown stays `""`, never invented.

Fields that feed the monthly review have their own sources; do not treat them as free text:

- `job_skills`: copy the skills list out of `source-job.md` **verbatim**, in Upwork's own wording. Translating or tidying them destroys the ability to count them.
- `client_industry` / `problem_type` / `job_fit` / `selected_asset`: copy from `meta.yaml` where the writer tagged them at screening. Empty → `unknown`; do not re-derive here.
- `contract_value`: leave `""` until the job is actually won, then fill the amount actually contracted. This is the only field updated after the record is created.

### Formatting hard rules

- **Every content section is raw plain text, pasted as-is.** No blockquotes, no code fences around content, no italics, no added bold, no re-wrapping, no "cleaning up".
- **Loom transcript**: keep timestamps and every recognition error exactly as captured.
- **Original script**: keep the screen directives and section text exactly as written.
- **Proposal**: the as-sent cover letter, character for character, including the real link in whatever form the user pasted.
- **Job post text**: full original from `source-job.md`, never summarized.
- Section order follows the template. Empty optional sections are deleted, not left blank.

### Review Notes (the one place for analysis)

Keep it factual and short:

- screening decision and any user override
- review rounds with scores: copy version / score / verdict from the review-score files verbatim, never from memory
- **Recording gap list**: compare the Loom transcript against the original script and list the key terms that got garbled (script phrase → what the transcript shows). This feeds the next case's `Key terms to practice`.
- known risks (proposal count, budget signals)

## Step 4: Clean up

1. Move ALL intermediates (every `proposal-v*.md`, `loom-script-v*.md`, `review-score-v*.md`, `revision-notes-v*.md`, `*-final.md`, `meta.yaml`, `source-job.md`, `screening.md`, screenshots) to `$JOBS_ROOT/submitted/.tmp/<job-slug>/`, as a single move of the whole folder.
2. Remove the now-empty case folder.
3. Update the record's frontmatter `status: submitted` and `last_update`.

## Step 5: Handoff

```text
Archived:
- [<job-slug>.md](<jobs-root>/submitted/YYYY-MM-DD/<job-slug>.md)
Recording gaps worth practicing before the next Loom: <top 3>
If this job produced a new outcome number or demo, add it to your profile.
```

## Hard constraints

- Never archive without the user's sent-confirmation.
- Never paraphrase, correct, or reformat as-sent content. Verbatim means verbatim.
- Never invent frontmatter data; unknown fields stay empty.
- Cases that were never sent do not enter `submitted/`; they stay in the pipeline or are dropped by the user.
