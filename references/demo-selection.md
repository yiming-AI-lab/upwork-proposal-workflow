# Demo Selection (optional)

A demo is an optional evidence source. This file tells the writer how to pick one when the user has several, how to present it truthfully, and what to do when the user has none. **The demo list is not in this file.** It is the `Portfolio demos` section of the user's profile file (filled once at setup); enumerate it at run time and never invent an entry.

## Step 0: Enumerate the user's inventory (every time, never from memory)

Read every demo entry in the user's profile. Each usable entry carries:

- **Status**: `runnable` (can be opened and run live on camera), `case-study` (a finished piece of work shown through a client-safe artifact: anonymized report, diagram, narrative; nothing from the client environment on screen), `vehicle` (a runnable twin used to demonstrate a case-study on camera; never selected on its own), or `retired` (history only, never selected).
- **Keyword table**: the client-language nouns this demo proves (tools, workflow shape, the failure it handles). The user writes it; the writer does not extend it.
- **Presentation notes**: which single flow to walk, what the first and last node show, what the demo does NOT prove, whether it may be duplicated and renamed.
- **Sharing**: link, access requirements, whether a client may see it.

An entry without a Status or keyword table is not ready: tell the user, do not improvise a table for it. An empty inventory is valid and common; go to "When there is no demo".

## Step 1: Match on the client's words

Take the nouns the client actually wrote (tools, the workflow, the failure they describe) and find them in the keyword tables. The demo whose **core workflow shape** matches the job's core workflow leads; count of keyword hits is secondary.

**Shared capabilities are tie-neutral.** Generic platform names, webhooks, API calls, error handling, validation, retries, "AI integration", chat alerts: every automation demo has them. They never decide between demos and never make a demo `high` on their own. A demo whose keyword table is merely the widest must not win on breadth.

Think in modules, not projects. If a past engagement covers several concerns (intake, invoicing, recovery, voice, architecture, audit), list each as its own entry and pick the one whose risky part matches the job's risky part; name a sibling in one sentence only when the post names that sibling's concern too.

## Step 2: Tiebreaks when two demos both fit

- **The agent vs what happens after**: the deliverable is the conversation (what it says, capture accuracy, platform) → the agent demo; the deliverable is the downstream records, approvals, or invoices → the back-office demo; both named → lead with the agent, one sentence for the module.
- **Existing system vs new system**: the system EXISTS and the client wants to know what is wrong with it → an audit or takeover case-study; the system does NOT exist and the client wants to know what to build and in what order → an architecture or scoping case-study; both → lead with audit, one sentence for architecture.
- **Design vs build**: the contract on the table is implementation → lead with the matching build demo, give the architecture case one sentence as "I settle the data model before writing anything"; the contract is a design or planning phase → lead with architecture (design-first shape in [proposal-writing.md](proposal-writing.md)).
- **Finding answers vs taking actions**: the pain is finding and trusting answers in their content → the retrieval or knowledge-base demo; the pain is an agent acting or running a conversation → the action demo; both → lead with the action demo, one sentence for grounding.
- Two demos together only when each proves a different explicitly named requirement. Lead with one; give the other one sentence.
- `none` when nothing maps. Forcing a demo onto a job that does not match hurts more than having none.

## Match levels

- `high`: the job's core workflow closely matches the demo's core workflow AND the distinctive keywords (not shared capabilities) hit.
- `medium`: shared pattern, different industry or tools.
- `low`: proves general ability only; mention briefly as transferable proof, never as the lead.
- `none`: forcing it would hurt.

Record in `meta.yaml`: `selected_asset` (`demo:<name>`, `case-study:<name>`, `demo:<lead> + <secondary>`, `loom`, `diagram`, or `none`), `demo_readiness`, `demo_reason`.

## Duplicate-and-rename (3 to 4 minutes, before recording)

Before recording the Loom, duplicate the selected `runnable` demo's workflow and rename the copy to the client's use case, so the canvas on camera reads "Acme Payment Webhook Intake", not the demo's own name. Perception shifts from "he has a similar project" to "he already started on mine", at a cost of minutes.

- Applies to: `runnable` demos whose presentation notes allow duplication, and a `vehicle` twin when a case-study runs on it.
- Does not apply to: `case-study` demos (show only their own client-safe artifact) and demos with nothing client-specific to rename.
- **Honest framing**: never claim the copy was built for them from scratch, but do not narrate the backstage either. Present it as your working setup for their category and offer to customize it.
- **Exception: skip the re-skin when the client filters for production evidence.** If the post says "production, not demos", announces a walkthrough interview, or uses audit language, show the ORIGINAL with its execution history: a renamed zero-history copy reads as a staged demo.
- Rename only the duplicate. Never touch a production original or any client workspace.
- Do NOT escalate to building a custom MVP per application. The per-application target is minutes from a template, not a rebuild.

## Presentation rules (proposal and Loom)

- In the proposal: one sentence of demo proof, phrased in the client's keywords, never a system tour. The track record arc is carried by the ending's Track record paragraph, not by the demo sentence.
- In the Loom (beat 4 of [loom-visual.md](loom-visual.md)): `runnable` → live run of ONE flow in business language, input node and output node longest; `case-study` → its own artifact or narrative; a `vehicle` twin → run the twin, narrate the case over it, never say the twin IS the client system.
- Say what the client sees, not node names.
- Every claim must pass the demo's own "does NOT prove" notes and the user's claim boundaries. No inventory counts anywhere.

## When there is no demo

An empty inventory changes the asset and the proof, not the structure. The proposal keeps the same opening rule, the same body rules, and the same three-paragraph ending.

**Demo Readiness** is still reported: `NOT NEEDED` when the job is small or text-provable, `BUILD OPPORTUNITY` (with a compact brief) when a small demo would materially raise credibility for this or similar jobs. Neither is built inside this workflow.

**The asset in the opening (third signal)** is still the Loom link, and **the Loom gets a diagram**. With no demo, the writer must generate a `Proposed Architecture` diagram per [loom-visual.md](loom-visual.md) using whatever diagram skill or tool the host offers; the diagram is beat 4 and the opening says so ("here's how I'd wire it:" + link). The writer never chooses the talk-only Loom on its own.

Only on explicit user instruction:

- user declines a diagram for this job → the job post stays on screen for beat 4; speak the client-specific insight over the exact sentence that triggered it, then the bounded first step;
- user declines a Loom for this job → a concrete giveaway inside the text (a contradiction spotted, a one-line diagnosis, a bounded first step), keeping the "here it is" shape.

Never emit a placeholder link, a `Portfolio:` line, or a mention that a demo is missing. The client is never told what the applicant does not have.

**Proof in the body** comes from the evidence classes in [evidence-policy.md](evidence-policy.md): `VERIFIED_EXPERIENCE` or `TRANSFERABLE_EXPERIENCE` from the profile, a metric callout using the client's own numbers, or a concrete implementation judgment ("the SLA clock has to start when the form lands, not when someone opens the ticket, or the number lies"). A judgment that could only come from having thought about THEIR case is the strongest substitute for a demo.

**The Loom's social-proof beat** (10 to 20s) shrinks to the identity clause plus whatever tab exists (the diagram, or nothing but the post); do not pad it with adjectives. **Beat 3's promise** changes from "I'll give you the system" to what actually exists: "this map is yours either way" for the diagram. Never promise a blueprint that does not exist.

The reviewer scores the result honestly: proof relevance and trust may land at 6 or 7 and be marked "constraint-capped: no demo, no outcome row". That is a user decision to send or drop, not a writing defect.
