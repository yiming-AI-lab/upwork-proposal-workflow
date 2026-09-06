# Profile Setup (run once, never per job)

The workflow reads one user-owned file, the **freelancer profile**, silently on every job. It is created **once**, before the first job, in one of two modes. After that, no job run asks the user about their background, their demos, their rate floor, or their communication style; the writer takes what the profile has and works within it.

## Where the profile lives

`$JOBS_ROOT/profile.md` by default (`PROFILE_FILE` overrides). Outside the skill folder, so public updates of the skill never touch it. The coordinator checks that the file exists; it never asks for a path.

## Mode 1: Interview

The coordinator interviews the user and writes the file itself. Rules:

- Explain first: the skill needs facts so it never invents experience; the interview takes about 15 minutes; everything is editable afterwards.
- Ask in **batches of 3 to 5 related questions**, in the order below; skip anything already answered; accept "none" and "skip" as valid answers and leave that field blank.
- Never rephrase an answer into a stronger claim. Write exactly what the user said, with the source they named.
- Do not ask for age, gender, nationality, photo, family status, or other sensitive details.
- At the end, write [templates/freelancer-profile.md](../templates/freelancer-profile.md) filled in, show the user which blocks are still blank and what each blank costs (for example "no Track record row: proposals will lead with an implementation judgment instead of an outcome number"), and stop. The first job runs only after the user says the profile is fine.

Interview order (highest impact first):

1. **Offer**: what service, for whom, with which tools or methods you personally deliver; work you refuse.
2. **Closest real work**: the two or three engagements, roles, or projects nearest to the jobs you want; what you personally did; kind (paid client / employment / internal / personal).
3. **Outcome numbers**: for each, a verified number (money, hours, turnaround, %), its source, and how it may be worded publicly. These become the Track record rows.
4. **Identity line, work mode, risk reversal**: one sentence each, in the user's own words.
5. **Demos**: any runnable demo or client-safe artifact; for each, status, the client-language nouns it proves, the one flow to walk, whether a client may see it. "None" is fine.
6. **Screening preferences**: rate floor, budget floor, exclusions, tolerances, what they are optimizing for.
7. **Voice and boundaries**: tone, sign-off, things that must never appear, NDA or unverified facts.
8. **Availability and credential**: timezone, hours, start date, may they be stated; credential exact name and link.
9. **Loom tab**: the one client-safe tab that shows the strongest outcome.

## Mode 2: Template

The user copies [templates/freelancer-profile.md](../templates/freelancer-profile.md) to `$JOBS_ROOT/profile.md` and fills it in. The template carries inline instructions for every block. The coordinator then reads it once and reports blanks and their cost, the same way as at the end of an interview.

## Three context layers

Keep these distinct in the file and in use:

1. **Identity and evidence**: what the freelancer can truthfully claim and prove (experience, case studies, demos, credentials, Track record rows, identity line).
2. **Application strategy**: which jobs are commercially worth pursuing (screening preferences, exclusions, tolerances).
3. **Communication preferences**: how the application should sound and what it may disclose (voice, sign-off, work mode, risk reversal, claim boundaries).

Only identity and evidence appear in client-facing text. A screening threshold never becomes a client-facing claim. Style preferences never override job instructions, truthfulness, or readability.

## Readiness per job (writer, silent)

The writer classifies the profile **relative to the current job**, without asking anything:

- `READY`: the profile establishes the relevant offer and at least one usable proof point, implementation insight, or honest transferable example, plus the three ending blocks.
- `PARTIAL`: relevant context exists, but a material fit decision or credibility claim is unsupported, or an ending block is blank.
- `ABSENT`: the file is missing or has no usable content. The writer returns "setup needed" and stops; the coordinator runs setup.

`PARTIAL` does not trigger questions. The writer proceeds with what exists, records each gap in `constraints.md` ("no Track record row for audit jobs", "Risk reversal blank"), and drafts within the facts: the client's own numbers or an implementation judgment instead of an outcome row; the ending shrinks to the blocks that are filled. The reviewer scores the result honestly and marks the affected dimension constraint-capped.

## The only per-job exception

The writer may ask the user **one** question during a job only when a screening question in the post demands a fact the profile does not hold (this job's rate, a specific availability date, a yes/no on a named tool). It asks that one fact, uses it, and offers to save it to the profile. It never opens a broader interview mid-job.

## Keeping the profile current (no nagging)

- After the archiver records a sent proposal, it may add one line: "If this job produced a new outcome number or demo, add it to the profile." Once, not repeated.
- Rows carry `Last verified`; the writer treats a row older than the user's stated freshness window as still usable but flags it in `constraints.md` for the reviewer.
- Any edit to the profile is the user's; the skill only writes it during setup or when the user explicitly asks it to add a fact.

## Evidence rules the profile must respect

- Preserve source type. Paid client work, employment, internal business work, personal projects, and portfolio demos are never collapsed into one "project experience" category.
- Every number is an outcome number with a source. Inventory counts are never stored as proof.
- A demo entry needs a Status and a keyword table to be selectable (see [demo-selection.md](demo-selection.md)); an entry without them is reported as not ready, never improvised.
- An empty demo inventory is valid. No sample entries, placeholder URLs, or fictional demos to make the file look complete.
- A credential is an exam or certification; never phrased as employment by or partnership with the issuer.
- Application performance history is optional and is used for numeric estimates only when the sample definition and size are stated.
