# Job Deconstruction

Distill the job before recommending whether the user should apply. The purpose is to explain the work beneath the wording of the post, not to generate a longer summary.

## Hiring thesis

Start with one direct sentence:

> The client is not merely hiring for **[surface task or tool]**; they are buying **[business result, ownership, or risk reduction]**.

Use this contrast only when the deeper conclusion is supported. If the post is genuinely a straightforward execution task, say so rather than inventing hidden strategy.

## Work type and maturity

Identify the dominant work type:

- `DISCOVERY`: clarify the problem, requirements, or viable approach;
- `DESIGN`: define architecture, workflow, data model, or operating process;
- `BUILD`: implement a defined outcome;
- `REPAIR`: diagnose and fix an existing system;
- `INTEGRATE`: connect tools and manage data movement or orchestration;
- `OPERATE`: monitor, maintain, support, or continuously improve;
- `ADVISE`: provide judgment, audit, training, or decision support;
- `HYBRID`: use only when two or more types are genuinely central.

Also assess maturity: idea, partially specified, existing but broken, production expansion, or ongoing operations. Maturity determines whether the client needs exploration, execution, rescue, or ownership.

## Requirement hierarchy

Sort requirements into four groups:

- `GATE`: absence makes credible delivery unlikely or violates an explicit requirement;
- `CORE`: materially affects successful delivery but may be evidenced through adjacent experience;
- `DIFFERENTIATOR`: increases response likelihood but is not essential to execute;
- `NOISE`: a broad tool list, copied boilerplate, or preference that does not appear central.

Do not automatically treat every named tool as a gate. Infer importance from deliverables, repetition, screening questions, system constraints, and consequences of failure.

## Capability stack

Describe capabilities as observable work, not keywords. Select only relevant dimensions:

- domain or business-process understanding;
- problem framing and requirements discovery;
- technical implementation;
- architecture and integration design;
- data handling, testing, reliability, security, or error recovery;
- stakeholder communication and expectation management;
- documentation, handoff, training, maintenance, or operational ownership.

For each central capability, state why the job requires it and what credible evidence would look like. “Knows n8n” is weak; “can design retries, idempotency, audit logs, and human exception handling across a multi-system workflow” is decision-useful when the job supports that conclusion.

## Ideal working profile

Describe the needed working pattern rather than inventing personality traits. Consider:

- specialist versus cross-functional generalist;
- task executor versus outcome owner;
- works from a complete specification versus structures ambiguity;
- solo delivery versus stakeholder-heavy collaboration;
- prototype speed versus production reliability;
- one-time builder versus long-term operator.

Avoid empty adjectives such as “passionate,” “rockstar,” “detail-oriented,” or “good communicator” unless the post makes a concrete behavior important. Do not infer age, identity, temperament, or cultural fit.

## Hidden work and risk

Surface work that is necessary but understated, such as access setup, requirements clarification, data cleanup, exception design, testing, documentation, change management, deployment, or maintenance. Distinguish:

- explicit scope;
- likely necessary work;
- speculative possibility requiring clarification.

Name the two or three risks most likely to affect delivery or hiring. Do not inflate complexity merely to make the role sound strategic.

## Application proof standard

Conclude with what an applicant must prove to earn a response:

1. the most important problem they must demonstrate they understand;
2. the capability or judgment that must be credible;
3. the strongest useful evidence type: directly relevant case, transferable result, demo, architecture insight, diagnostic observation, or clarifying question;
4. any concern the proposal must neutralize.

This proof standard should drive service-fit assessment, evidence selection, demo readiness, and the proposal opening.

## Compact output

Use this shape:

```markdown
## Job Essence

**What the client is actually buying:** ...
**Work type and maturity:** ...
**Required capability stack:** ...
**Ideal working profile:** ...
**Hidden work and risks:** ...
**What a strong application must prove:** ...
```

Keep it analytical and concise. Every inferred point must remain visibly qualified.
