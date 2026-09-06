# Screening Policy

## Policy precedence

1. Use the user's explicit rules.
2. Otherwise use any project or workspace policy the user has placed in scope.
3. Otherwise use the defaults below as a conservative starting point, label them as defaults, and invite the user to change them for future jobs.

Treat the user's thresholds as decision preferences and surface any misses prominently. They guide the recommendation but do not remove the user's right to proceed.

## Default screening signals

| Signal | Default |
| --- | --- |
| Payment | Verified |
| Client history | More than $0 spent |
| Budget | At or above the user's stated floor; if no floor exists, ask rather than invent one |
| Posting age | No more than 48 hours |
| Competition | Fewer than 20 proposals |
| Service fit | The requested outcome falls within the user's stated offer and capabilities |

Client location, hire rate, long-term potential, job-description quality, and case-study fit are preference signals unless the user explicitly treats one as a non-negotiable requirement.

## Recommendation logic

Base service fit on the job's capability stack and proof standard, not on keyword overlap between the post and the user's profile.

- `apply`: service and evidence fit, acceptable economics, credible client, and a workable competition window; or promising with trade-offs the user should see but that do not outweigh the fit.
- `skip`: weak economics, fit, client signals, or competition make other opportunities a better use of effort; or a hard requirement the user provably cannot meet.
- `uncertain`: missing or contradictory facts prevent a responsible recommendation, or the trade-offs are genuinely balanced. The user decides.

A threshold miss should materially lower the recommendation and must never be hidden inside an average score. It does not automatically end the workflow if the user chooses to proceed.

## Competitive outlook

Estimate the likelihood of earning a client response as `HIGH`, `MEDIUM`, `LOW`, or `UNKNOWN`. Base it on observable signals such as:

- proposal count and posting age;
- service and evidence fit;
- client spend, hire rate, and relevant hiring history;
- budget alignment and Connects cost;
- specificity of the job post;
- whether a credible demo or differentiated insight is available.

This is a relative outlook, not a measured probability. Do not output a percentage from intuition. A numeric range is permitted only when the user supplies a sufficiently relevant history of submitted proposals and responses; state the sample size and calculation.

## Screening output

Show a short table with: criterion, observed fact, source status (`Confirmed` or `Unknown`), and assessment. Then give no more than three decisive reasons for the recommendation.

End the assessment with the recommendation, the main reason, and the user's options: apply, skip, or provide missing information. Do not draft until the user chooses. Launching the pipeline is not the apply decision.
