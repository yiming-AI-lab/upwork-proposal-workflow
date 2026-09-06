# Loom Visual and Script

Two parts. The **visual** is the screen-share aid (a reused portfolio artifact or a proposal-specific diagram). The **script** is what the user says over it. Rules marked **(house rule)** carry numbers that are this workflow's own operationalization. Everything personal in the script (the outcome number, the identity clause, the credential, the social-proof tab) comes from the user's profile file (created once at setup, see [profile-onboarding.md](profile-onboarding.md)); this file never supplies those facts.

**A Loom is recorded for every proposal by default.** The user opts out per job, explicitly; the writer never drops it on its own. What is on screen follows what the user has: a runnable demo, a case-study artifact, a `Proposed Architecture` diagram, or only the client's post. The five beats below hold in every case.

## Part 1: The visual

Create a visual when it makes the proposal easier to understand or more credible. It is a screen-share aid for the Loom, not a technical specification or a substitute for a working demo.

### When to create one

**No demo means a diagram is mandatory.** If the user has no runnable demo and no case-study artifact for this job, the writer generates a `Proposed Architecture` diagram before writing the script; beat 4 is that diagram. A Loom that only talks over the job post is the fallback for an explicit user opt-out of diagrams, never the writer's choice.

With a demo available, create or reuse a visual when at least one applies:
- the workflow has multiple systems, decisions, or exception paths;
- architecture, data flow, approvals, or risk controls are central to the client's decision;
- the job is design-first (the diagram walkthrough IS the asset in the opening);
- competition is high enough that a tailored visual is a meaningful differentiator.

Skip it only when the user has a matching runnable demo to show instead, or when the user explicitly declines a diagram for this job.

### Reuse versus generate

Reuse an existing visual only when its main trigger, systems, outcome, and important decision logic genuinely match. Disclose it as an existing portfolio example. Do not relabel an unrelated diagram to look custom.

Otherwise create a proposal-specific architecture diagram and title it `Proposed Architecture`. Never title it `Built Solution`, `Completed Workflow`, or anything that implies implementation.

### Diagram contract

- Prefer 7 to 9 nodes; exceed 10 only when removing a node would hide a material branch.
- Use a left-to-right flow for ordinary Loom walkthroughs.
- Show the trigger, core processing, one or two meaningful decisions, human review where relevant, outcome, and audit or error handling.
- Use short business-readable labels, usually two to five words.
- Keep API endpoints, JSON, credentials, OAuth details, and node configuration off the main canvas unless one is the client's central problem.
- Distinguish automatic and human paths clearly.
- Do not add features unsupported by the job post or the stated proposal.

### Rendering

**Use the bundled Excalidraw skill; do not describe the diagram in prose when it can be drawn.** This package ships `skills/excalidraw-flowchart/` (read its `SKILL.md` and follow its Create mode). It needs Node.js, because it runs `npx @swiftlysingh/excalidraw-cli`; nothing is installed permanently. Rules when calling it for a Loom:

- write the DSL from the diagram contract above (7 to 9 nodes, business labels, one or two decisions, human step, outcome, error path); title node or baseline label `Proposed Architecture`;
- pass `@direction LR` explicitly. The bundled skill defaults to top-to-bottom for documents; a Loom is a landscape screen share, and this is the documented exception it allows;
- a 9-node LR strip renders roughly 2,500 px wide at default spacing, so the full-diagram shot at the start of beat 4 is small. Use `@spacing 40`, keep branches short, and zoom node by node while narrating; if it still does not read at one glance, switch to `@direction TB` and scroll down the spine on camera;
- output to the case folder: `-o <case>/proposed-architecture.excalidraw`, not the skill's default `.tmp/`;
- the user opens the file at excalidraw.com (File > Open) for the recording; it is editable there if they want to adjust labels first;
- render a temporary PNG only to inspect readability and overlaps, then delete it, per the bundled skill's rules.

If the host has another diagram capability the user prefers (a diagramming MCP, a canvas that accepts Mermaid or SVG), it may replace Excalidraw; save the artifact as `proposed-architecture.<ext>` either way. If Node.js is missing and nothing else can render, output Mermaid or a precise node-and-arrow brief in `proposed-architecture.md`, label it `Not rendered`, and tell the user to render it before recording.

Do not install software, create external accounts, upload files, or publish the visual without authorization.

### Visual quality check

Before delivery, verify:

- every narrated node exists on the diagram;
- every major visual branch is explained;
- labels remain readable during a normal screen share;
- the title and narration do not imply a working deployment;
- the artifact contains no private credentials, customer data, or unrelated project details.

## Part 2: The Loom script

**What the script optimizes: the reply.** The Loom only plays after the proposal is opened; its job is to make the client message back. The client is buying the packaging, not the inside. Every second either proves "a real human is on my job right now", proves "this person makes money for people", or shows the thing they asked for working. Nothing else earns screen time.

- **About 2 minutes, 150 to 250 words** (house rule). Default to the short end.
- Write the script only after the visual (or the chosen demo flow) is final. Each spoken section corresponds to a visible screen or node, in the same order.

### Five beats, in this order

1. **Hello + their post on screen (0 to 10s).** Unlike the proposal, the Loom opens with a greeting and the client's name when the post gives one; it is a professionalism thing. Say what you saw in their words while dragging, highlighting, zooming, or scrolling the actual post. Live interaction proves you are on their job right now; a screenshot can be faked.
2. **Social proof in under 10 seconds (10 to 20s).** Three things, in this order: the user's strongest **outcome number** for this job's category (money, time, or rate from their profile, never inventory counts), one short spoken **identity clause** from their profile (for example "[N] years I've been building [your field]"), and their **credential** if they have one. Nobody cares about a 45-second biography. **Do not re-read the proposal's Track record block on camera.** The proposal tells the arc; the Loom shows one piece of it: pick the single strongest clause, say it in one sentence, and have the tab on screen that makes it visible (the user's social-proof tab from their profile: an anonymized report, an architecture diagram, a running instance). If the user has no outcome number yet, spend these seconds on the identity clause and the tab, and move on; do not fill the gap with adjectives.
3. **The promise (20 to 30s).** Say out loud that they are getting the asset: "what I'm going to do is give you the system; if you want it, by the end of the video just send me a message and I'll give you the blueprint." Then a hook into the demo: "let me show you exactly how, in a second." By 30 seconds the client must have seen something that makes them keep watching.
4. **Proof: one flow, opened, walked (30s to 1:40).** Open the real scenario, workflow, terminal, or the full diagram, not a zoomed-out canvas of little squares. Walk ONE path that maps to their deliverable, and spend the time on the first node (what goes in) and the last node (what they receive). Every beat in the client's outcome language, bound to a keyword from their post; show the platform they named. If something was built or re-skinned for them, press on it, never rush past it. Call out one design decision that prevents THEIR failure mode, not a generic one. Say what the client sees, not node names: "the lead gets scored and lands in HubSpot", not "the Code node parses the JSON". Type-specific proof:
   - **Person-fit**: the strongest 1 or 2 items from the evidence menu, bound to their top filtering criteria. A mismatched feature tour as the main proof is a fail; the client is hiring a person, not buying that workflow.
   - **Deliverable-fit**: about 60 to 70 seconds on the one path that maps to their build; input node and output node longest.
   - **Design-first**: full-screen the `Proposed Architecture` diagram, read it as a story, then stop on the ONE decision that maps to the expensive mistake named in the proposal. Then the build-order view: "each of these blocks starts and stops on its own". Do not show a canvas, a scenario, or code; this type sells thinking, and showing a build says "he'll just start building".
   - **Honest framing**: never claim a reused or renamed demo was built for this client from scratch, and do not narrate the backstage either. Present it as your working setup for their category and offer to customize it. Never say "I built this for you" when the artifact is only a diagram; prefer "I mapped out the control flow I'd use for your workflow."
5. **Close, three sentences (1:40 to 2:00).** (a) Repeat the gift: "as mentioned, I'll give this to you." (b) State the intent: "my end goal is a long-term retainer, so I want to do one project for you and knock it out of the park." (c) Zero friction: "I could start today, my online-for-messages bubble is on right now, I'm waiting for you to respond", plus one tiny concrete next step (send one sample record, one export, the roadmap as it is). **No price in the Loom** (house rule).

### Recording and delivery rules

- **Move in the first 3 to 4 seconds.** Loom builds its preview GIF from the opening frames; visible motion (switch a window, move the cursor, lean toward camera) buys more plays.
- **Tabs ready before recording**: (1) their job post, (2) the social-proof tab, (3) the demo or diagram opened to the one flow you will walk, (4) any terminal or runtime the demo needs. Nothing else open; never an `.env`, a client workspace, or a private client document.
- **Spoken register**: most sentences under 12 words, none over 18. One idea per sentence. No written signposting ("Quick background:", "Quick intro", "In summary,", "Let me introduce"); say it like speech ("A bit about me."). Nobody says "Quick intro" to a camera.
- **Simple verbs**: comes in, turn, add, write, run, update, notify, trigger, monitor. Avoid: implement, integrate, orchestrate, leverage, utilize.
- **Script format**: mark the five beats with timestamps so the user can rehearse to the clock. **End the script with `## Key terms to practice`**: the 5 or 6 nouns and numbers that must land clearly when recording (tool names, the outcome number, the next-step nouns).
- Every demo or case-study claim must pass the user's claim boundaries from their profile. Never open private client evidence on camera; never present a case-study artifact as a runnable workflow; never present a proposed diagram as a completed or deployed system.
