# Proposal Writing

Hard rules for the client-facing proposal. Rules marked **(house rule)** carry specific numbers that are this workflow's own operationalization; treat them as constraints, not suggestions. Everything personal (track record, identity line, work mode, risk reversal) comes from the user's profile file, created once at setup ([profile-onboarding.md](profile-onboarding.md)); this file never supplies those facts.

## What the proposal optimizes: the view

The client decides whether to open a proposal from the list view. The list shows the profile (photo, badge, name, location, title) plus roughly the first 50 to 150 characters of the cover letter. Nothing below the fold affects whether the proposal gets opened. The writer controls exactly one of those inputs: the first 150 characters. Treat them as the whole product; the rest of the proposal is what happens after the click.

## Opening: first 150 characters, three signals

The first 150 characters must carry three signals: you read the post, you do this all the time, you are giving them something.

1. **Read it**: paraphrase THEIR ask in their own nouns (tool names, the workflow, the number they quoted). Use the client's name if the post gives one.
2. **Bread and butter**: one clause. "I build exactly this." "This is what I do all week."
3. **The asset**: "already built the [intake / invoicing / voice] half of this, here it is:" plus the link. The link must land inside the first 150 characters or be the very next thing after them. The client evaluates who is good by clicking; the link is how they do it.

Count the characters before saving. If the three signals plus the link do not fit, cut words from signals 1 and 2. Never drop the link.

**The asset is a Loom link by default.** Every proposal gets a Loom unless the user explicitly opts out for this job. What the Loom shows depends on what the user has (see [loom-visual.md](loom-visual.md) and [demo-selection.md](demo-selection.md)): a runnable demo, a case-study artifact, a rendered `Proposed Architecture` diagram, or, with none of those, the client's own post with the client-specific insight and a bounded first step spoken over it. The link is the asset either way; the opening says what the video gives them ("here's how I'd wire it:", "here's the intake half running:").

Only when the user has opted out of a Loom does the third signal become a concrete giveaway inside the text: a one-line diagnosis of their post, a spotted contradiction, or a bounded first step. Never emit an empty URL, an invented artifact, or an unresolved placeholder; while the Loom is not yet recorded, the draft carries `<loom-link>` and the final checklist replaces it. Selection among several demos, and the full no-demo path, are in [demo-selection.md](demo-selection.md).

**Banned in the opening.** Each of these reads as copy-paste or self-disqualification: "Hello", "Hi there", "I am excited", "I read your job post", "I am confident", "I've reviewed your posting", any generic truism about their industry ("Creating cohesive branding is a huge part of..."), and any sentence that lowers your status ("new to the platform", "still building my portfolio", "student").

**No template reuse across jobs.** The three signals are a checklist, not a sentence. Two consecutive proposals with the same opening clause fail.

## Body rules

- **80 to 150 words** for the whole proposal (house rule). The standard is bullet-point density. A multi-page proposal is a post-sales-call consulting document, a different artifact; never cite one to justify a long cover letter.
- **Dollar signs beat years, outcome numbers beat inventory numbers.** "15 years in the industry, I build in Make and n8n" makes you the same as everyone else. What makes you different is what you earned, saved, or fixed for other people. Every proposal carries at least one **outcome number** in its first half: money (what a failure cost the client, what was saved, earned, funded), time (hours per week, turnaround), or a rate (% that failed or improved). **Inventory numbers are banned**: how many workflows, tables, fields, scripts, milestones. They change every phase and say nothing about value.
- **Every number has a source.** The source is the user's evidence file or the client's own post. No source, no number. If the user has no outcome number yet, anchor on the client's figures from the post (what their problem costs them) or on a concrete implementation judgment. Do not invent.
- **Short is not staccato.** The register is short sentences that still talk to a person ("Read everything and can crush this for you. Just spent a minute building something. Here's a link."), not spec fragments. Two consecutive verbless or subject-less fragments mean rewrite. Keep connectors (So / And / Then / Here's why) between points. Every sentence still addresses you or I. The word cap is a length discipline, never a reason to amputate grammar.
- **Plain text safe**: no em dashes or en dashes, no markdown bold, no `---` rules, no internal notes inside the paste-able body.
- **Screening questions**: answers go in the Upwork question fields, conclusion-first, one answer per question. Remind the user in a note OUTSIDE the paste-able body. Preserve requested formats such as numbered responses, keywords, or portfolio links when legitimate.
- No inventing facts. Gaps the user cannot truthfully close are reported to the user, never written into the text.

## Ending: three blocks, in order

Content is fixed, wording is rewritten per job so no two proposals share a sentence. **The block labels and square brackets are internal structure.** The paste body renders three plain paragraphs with no labels and no brackets; a literal `[Track record: ...]` on Upwork reads as an unfilled template.

```text
[Track record: <ONE outcome row from the user's profile that matches this job's category> + <the user's identity line: years in the field, how they work, credential if any>]
[Work mode: <the user's stated way of communicating and delivering, e.g. async by default, daily updates, weekly recap, no unnecessary calls>]
[Risk reversal: <the user's stated guarantee on the first milestone, e.g. if the first milestone doesn't deliver what we agreed, you don't pay>]
```

- Every claim in the Track record block comes from the profile's `Track record rows` and `Identity line`. Read them at write time, never from memory. Outcome numbers only, each with its source noted in the profile. No inventory counts, even when a portfolio page has them.
- Pick the row by job category (audit or takeover, build or rebuild, voice, design or scoping, knowledge base, or whatever categories the user has defined). If no row matches, use the closest transferable row and say the relationship honestly, or drop the number and keep the identity line.
- The identity line never stands alone as the credibility claim; it follows the outcome number.
- A credential is an exam or certification, never phrased as employment by or partnership with the issuing company. For jobs that name the credential's domain, it may additionally appear in the proposal's first half.
- Never write "New to Upwork" or any equivalent. The risk reversal stands on the bounded first milestone, not on apology.
- If Work mode or Risk reversal is blank in the profile, the ending has fewer paragraphs and the gap is recorded in `constraints.md`. Do not invent a guarantee and do not ask mid-job; the profile is fixed at setup.

## Job types and proposal shapes

Classify the client's buying intent before writing (see [job-deconstruction.md](job-deconstruction.md) for the analysis). If mixed, choose the dominant intent; if truly split, say `Mixed` but still pick one shape.

### Person-fit

The client is hiring a capable person to own a category of work over time. Signals: "Looking for someone who can...", "The ideal person...", ongoing engagement, broad skill stack, no single clearly defined deliverable.

Positioning: I am the right person to own this category of work.

Before writing, list what this client actually screens for, in their order of emphasis (platform mastery, hours or timezone, independence, QA and reliability, communication mode, domain familiarity, speed of response). The proposal must visibly answer the top criteria. If the post names a filter, the draft answers it explicitly.

```text
[Opening, under 150 characters, three signals: their ask in their nouns + "this is what I build all the time" + the asset with the link]

[2 to 4 sentences answering their top filtering criteria, picked from the evidence menu below]

[Ending: Track record (cut to this job's category) / Work mode / Risk reversal]
```

Evidence menu (pick the 2 to 3 items the post signals; never reuse a canned combination):

- **Live demo run**: strongest for build-heavy roles; run it, do not describe it. Only when the user has one.
- **Platform mastery**: name their exact stack and what the user runs on it.
- **Working process**: spec intake, questions once, build, test, handoff. Only when the client has a delegation structure.
- **QA and reliability discipline**: error handling, edge-case testing, handover docs.
- **Availability, timezone, communication mode**: when the post makes it a filter.
- **Domain familiarity**: their industry's workflow, named concretely.
- **Metric callout**: quantify the cost of their problem or the value of the fix in the client's own numbers. Only when the post gives real numbers; never invent figures.

Quality bar: the client should feel *this person already works the way we need, the proof is real and specific to our stack, and trying them is low-risk and can start now.*

### Deliverable-fit

The client wants a specific workflow, automation, dashboard, integration, fix, or build. Signals: "Build X", "Create Y", "Fix Z", clear deliverable, clear tool stack, success can be shown in a demo.

Positioning: I understand the exact thing you need built. Here is the closest working proof.

Type-specific rules:

- **Lead with the deliverable, not biography.** Sentence 1 names their exact build.
- **Exactly 2 to 3 bullets, one line each**: one client requirement to one proof point. Not a spec sheet, not a paragraph.
- **At least one client-specific insight that is not a paraphrase of the post**: a contradiction spotted ("the post says ClickUp, the deliverables say Monday"), an unstated constraint, their concrete failure mode, or a scoping question that proves you thought about their case. No insight means not ready to save; read the post again.
- **Bound the first version.** Name a small concrete V1 (one inbox, one pattern, one table) so the scope feels controlled.
- **Do not write a technical plan or explain the full demo.**

```text
[Opening, under 150 characters, three signals: their ask in their nouns + "this is what I build all the time" + the asset with the link]

- [Requirement 1 → one-line proof]
- [Requirement 2 → one-line proof]
- [Key reliability decision → the failure mode it protects them from]

[The client-specific insight + bounded V1 + sample request, 1 to 2 sentences]

[Ending: Track record (cut to this job's category) / Work mode / Risk reversal]
```

Quality bar: the client should think *this maps directly to the thing I need built, the risky part already exists, and starting costs me one sample.*

### Design-first

The client wants the decision of what to build before anyone builds it: architecture, system design, data model, scope or statement of work, phased build order, platform selection. Signals: "We have a roadmap / spec / idea and need someone to tell us how to build it", "architect", "data model", "scope this", "SOW", "which platform", deliverable is a document or diagram rather than a running system.

Not design-first: an implementation job that mentions rework or "scalable architecture" in passing. That is deliverable-fit with one architecture sentence.

Positioning: the expensive mistake is the shape of the data and the order of the build; I settle those first, fixed price, then you decide.

Before writing, find the ONE decision in the post they have not made or have made wrong (two kinds of facts filed as one, a portal and a back office described as two systems, a platform named before the first page exists). That sentence is the client-specific insight; without it the draft is a template.

```text
[Opening, under 150 characters, three signals: their ask in their nouns ("you have a roadmap and need the build order / data model / scope") + "this is the work I do before I build anything" + the asset with the link (the asset is the diagram walkthrough)]

[The expensive mistake, 1 to 2 sentences: the decision in their post that costs a rebuild if made late, stated as a question they will recognise, not as advice]

[What they get, 3 bullets, deliverable-shaped, not method-shaped:
- the architecture: every way a customer enters and the one record set they all write to
- the data model: the record kinds and the boundary that stops the most expensive rework
- the build order in blocks they can start, stop, and price one at a time]

[First step, 1 to 2 sentences: fixed-price design document, N working days, they read it and decide whether to build with me or anyone else. One tiny ask to start: "send me the roadmap as you have it".]

[Ending: Track record (design or scoping row) / Work mode / Risk reversal]
```

Rules specific to this type:

- **Never propose the solution.** Name the mistake and the deliverable; the design is the paid work. Sketching their data model in the proposal gives the work away and reads as guessing.
- **Price shape, not price.** "Fixed-price document, read it then decide" is the offer; the number goes in the Upwork bid field, never in the text.
- **Blocks language.** Say the build will be offered in independently startable blocks priced one at a time, if that is the user's actual delivery model. Never claim a block was built for a past client unless the user's profile says so.

Quality bar: the client should think *this person saw the thing we were about to get wrong, has done this exact document for someone who paid for it, and the first step is cheap to say yes to.*

## Final language pass

Remove generic openings, unsupported superlatives, repeated selling points, bloated tool lists, formal sign-offs, fake familiarity, dashes, markdown, bracketed labels, and any claim that cannot be traced to the evidence map or the user's profile blocks. Count words and count the opening's characters one last time.
