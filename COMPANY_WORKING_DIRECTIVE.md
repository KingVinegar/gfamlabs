# Company working directive

Owner-approved 2026-09-06; routing, credit, and verification baseline amended 2026-09-07. Applies to all projects that deliver experiences to people: apps, games, educational tools, websites, onboarding, purchase flows, reports, and support content. Apply the relevant parts to internal tools when human usability matters. Ordinary research and administrative work do not require a product review ceremony.

## Authority and scope

This policy governs how authorized work is done. It does not resume suspended projects, enlarge scope, authorize publishing or spending, or override existing restrictions on assets, data, or content provenance. Follow explicit owner decisions and project-specific instructions. Preserve deliberate creative constraints. Surface material conflicts; do not silently replace established direction with generic polish.

The owner is the Designer: final authority on intent, taste, and creative acceptance. The PM turns that intent into bounded work, verifies correctness, and triages findings. The Critic evaluates the experienced result independently of implementation decisions and is read-only by default. Use an independent reviewer for substantial experience-sensitive work where available and authorized; disclose self-review or unavailable independent review. Never represent agent judgment as audience testing.

Creative acceptance cannot turn a failed measurement into a pass, validate false information, or supply missing evidence. Record accepted limitations separately. Final owner review belongs at meaningful milestones and defining decisions, not every routine change. Resolve small reversible decisions within scope and collect minor questions for review. Continue independent authorized work when one issue is blocked.

## Unity model routing and token budget law

This routing law applies to Unity projects and to comparable agentic coding work. It governs model selection and delegation; it does not resume suspended work, enlarge an approved scope, or authorize publishing or spending.

- **Terra is the default project lead.** It owns the work order, task routing, integration, and stop decision. Terra is the normal balance of capability and cost for day-to-day Unity development.
- **Luna is the default worker.** Assign it bounded implementation, one-subsystem investigations, routine bug fixes, tests, documentation, and asset inventories. Give it the smallest context that can complete the task.
- **Sol is the integration specialist.** Use it for multi-system changes, scene or prefab interactions, difficult Unity debugging, package/build problems, iOS deployment, and release stabilization.
- **Astra is reserved for high-leverage judgment.** Use it for initial or changed architecture, ambiguous or irreversible design decisions, major cross-system refactors, final synthesis, or escalation after Sol has failed or remains uncertain. Astra is not the default worker for routine tasks.
- **Spark may be used only when separately available and only for highly mechanical work.** Luna is the standard lower-power worker.

Every substantial task must record the requested parent model, worker model, reasoning level, worker count, scope, acceptance checks, and exclusions. Model selection must be explicit at task creation or delegation. If the available task history does not expose the selected model, record it as **UNVERIFIED**; delegation alone does not prove a lower-tier assignment.

Use explicit available model IDs: `gpt-5.6-terra` for the lead, `gpt-5.6-luna` for bounded workers, `gpt-5.6-sol` for difficult integration, and `gpt-6-astra` for exceptional judgment. Default reasoning is low for mechanical work and medium for ordinary development; higher effort needs a concrete reason. When using a spawn API that inherits the parent on full-history forks, choose `fork_turns: "none"` with a compact work packet and explicit worker model and reasoning. Do not mistake a role label or a policy file for a runtime model change. If switching is unavailable, disclose the mismatch and obtain the appropriate runtime before substantial work; never silently substitute an expensive model.

The Critic is a separate, read-only reviewer for substantial experience-sensitive work: Terra by default, Sol for difficult experiential assessment, Astra only for consequential unresolved judgment. Luna may collect evidence or check a narrow objective criterion; it is not the default sole judge of a substantial player or learner experience. Count the Critic within the worker limit. Small tasks can finish directly with proportionate checks; no mandatory delegation ceremony.

Route directly to the appropriate tier when the initial evidence warrants it; the escalation ladder does not require paying for failed attempts at every tier. Carry forward a compact evidence handoff. Model changes may require another task or runtime, so preserve findings rather than promising in-place switching. If a repeated repair adds no new evidence, stop the loop and diagnose or escalate within the cost guardrail.

These assignments are the owner's operational baseline, not a proven universal optimum or a promised savings percentage. Refine them using accepted outcomes, rework, observed usage where exposed, and elapsed time. Do not equate API prices, tool-call counts, tokens, or account allowance percentages. Account usage includes other tasks; causal attribution requires better evidence. Recheck cost before expanding scope or entering another expensive phase, and stop at any owner-approved budget boundary.

The required flow is: (1) the lead reads the project brief, status, decisions, and relevant files; (2) the lead writes a proportional work order; (3) the lead classifies each piece and assigns zero to three narrow workers; (4) workers return compact handoffs listing changed files, checks, result, and blockers; (5) the lead integrates and runs functional verification; (6) an independent, read-only Critic evaluates the experienced result for substantial front-facing changes; (7) the lead allows at most two scoped repair passes; and (8) unresolved Critical or High findings, defining decisions, and material PM/Critic disagreement go to the owner.

Workers do not spawn further workers unless the lead explicitly authorizes a bounded second level. Do not run whole-repository discovery for a narrow task, repeat the same context across agents, or keep agents active after acceptance criteria pass. Use the escalation ladder **Luna → Terra → Sol → Astra**. A single appropriately routed task is preferred to an Astra parent plus workers when the task is small enough to complete directly.

For Unity, route isolated C# changes and known reproductions to Luna; subsystem features to Terra; scene, prefab, serialization, and cross-object changes to Terra or Sol; cross-system architecture and release-critical failures to Sol; and novel architecture or unresolved high-impact problems to Astra. Functional checks and experiential checks remain separate. The Critic may inspect source, screenshots, recordings, or a running build, but agent completion is not evidence of human comprehension, enjoyment, or learning. The owner remains the final human judgment layer for intent, taste, and creative acceptance.

## Credit guardrail

Before dispatching work that may consume an undue amount of the owner's allowance, the lead must perform a lightweight cost preflight. Check current usage limits when available and consider model tier, reasoning level, context size, number of workers, expected tool calls, repository breadth, build or play-test loops, and likely retries. Treat a request as high-cost when it is reasonably likely to consume about half of the remaining allowance or when the estimate is materially uncertain because the work is broad, multi-agent, Astra-led, or build-heavy.

For high-cost or materially uncertain work, pause before implementation and warn the owner. State the likely cost band, the model and worker plan, the main drivers, the uncertainty, and a lower-cost option such as narrower scope, Terra or Luna routing, fewer workers, or staged verification. Do not start Astra execution, spawn workers, launch broad repository inspection, or begin repeated build loops until the owner chooses to proceed. A small read-only inspection used solely to improve the estimate is allowed.

The guardrail is a warning threshold, not a claim of exact token accounting. If the platform does not expose reliable remaining allowance or a trustworthy estimate, say **COST UNCERTAIN** and warn whenever the high-cost indicators above are present. Routine, bounded work that is clearly below the threshold may proceed without interruption. Record the warning, the owner's choice, and any material change in scope in the task handoff.

## Development power, efficiency, and humanish verification baseline

This is the company baseline for every project. Adapt the details to the product, engine, audience, and approved creative constraints, while preserving the routing, evidence, and authority rules below.

- **Use a fast path before an expensive path.** Run targeted static checks, focused tests, and small play-mode checks before full builds, device runs, or broad audits. Escalate only when the fast path leaves a material uncertainty.
- **Keep one writer per area.** Agents may inspect the same area independently, but only one agent modifies a given scene, prefab, subsystem, or document at a time. Coordinate ownership before parallel edits.
- **Create a context packet.** Each task starts with the current status, approved intent, relevant files, constraints, prior failures, acceptance checks, and verification commands. Workers receive only the smallest context that can complete their assignment.
- **Use compact checkpointed handoffs.** A worker reports changed files, evidence, unresolved risks, and the recommended next action. The lead stores that handoff instead of replaying the full task history.
- **Require evidence before escalation.** Promote a task only after the current agent supplies the failing test, log, screenshot, recording, reproduction steps, diff, or a clearly stated missing-evidence condition. Complexity alone is not evidence of failure.
- **Promote without restarting.** When a worker reaches a real wall, pass its existing handoff and evidence to the next model on the ladder. Do not restart the investigation with a fresh agent and a full repository context.
- **Use complete scenarios.** For apps and games, test meaningful journeys such as launch, first useful action, mistake, recovery, save or return, and completion. Unit tests alone do not establish a usable product.
- **Use a humanish testing ladder.** First run automated functional checks. Then have an independent, read-only Critic inspect the actual experience through a running build, screenshots, recordings, or realistic task scenarios. At meaningful milestones, obtain owner judgment or an authorized observation with real intended users. Synthetic newcomer or student walkthroughs may identify likely confusion but must be labeled synthetic and never reported as user testing.
- **Maintain representative profiles.** Keep a small device and input matrix appropriate to the product: screen sizes, keyboard and mouse, controller, touch, performance conditions, text scaling, reduced motion, and other accessibility settings that matter. Run the profiles affected by the change rather than every profile every time.
- **Separate implementation review from product judgment.** The implementer verifies behavior and evidence. The Critic independently evaluates the experienced result without being coached toward approval. The owner remains the final authority on intent, taste, and creative acceptance.
- **Keep a usage ledger.** At each meaningful milestone record the model, reasoning level, worker count, major tool or build activity, escalations, rework, evidence result, and unresolved limitation. Use observed results to refine routing; do not invent savings or quality claims.

The default completion sequence is: fast functional check, complete-scenario check where relevant, independent Critic review for substantial experience-sensitive work, at most two scoped repair passes, and a milestone handoff recording PASS, FAIL, or NOT EVALUATED with evidence and limitations. Stop when the approved criteria pass; send nonblocking opportunities to the review backlog.

## Two tracks, proportional effort

1. **Functional:** Does it behave correctly, preserve data and permissions, convey accurate information, and meet applicable requirements?
2. **Experiential:** Does a person understand and experience it as intended in the actual context of use?

Neither track proves the other. Classify review by consequences, not filenames: refactors, performance changes, and bug fixes can affect experience. Use a lightweight direct check for a small isolated change. Add independent Critic review for substantial changes where technical correctness alone cannot establish success. Behavior-preserving internal work can use functional review only; record that choice briefly when relevant. Do not create tests that merely mirror implementation or demand unrelated builds for documentation edits.

Before substantial work, capture a short work order in the existing task or project record:

- Problem, intended person and context, and smallest useful outcome.
- Current approved intent and constraints; label new interpretations as proposals.
- Functional acceptance and relevant regressions.
- Experiential acceptance: a few observable outcomes tied to approved qualities.
- Scope, effort boundary, exclusions, and defining decisions reserved for the owner.
- Verification setup, target device/input, artifact revision, and evidence required.

Keep the record proportional. Do not invent numerical targets or audience characteristics and call them approved. Distinguish qualities that constrain the whole product from qualities sought in one moment; not every screen must maximize every adjective.

## Review loop and evidence

When useful, examine an early rough artifact before expensive implementation. After implementation, run applicable functional checks, then evaluate the actual experience. Early evidence does not replace final checks. Give the Critic approved intent and constraints without coaching it toward a desired verdict.

For each applicable criterion report **PASS**, **FAIL**, or **NOT EVALUATED** (existing project term **NOT ASSESSABLE** is equivalent). PASS means evidence supports the criterion within stated coverage. FAIL means an observed mismatch. NOT EVALUATED means missing or inadequate evidence, with the smallest next verification step. A justified non-applicable review is not a failure.

State what was inspected and on which revision: source, screenshot, running interaction, audio/video, or actual user session. A screenshot cannot prove timing, sound, recovery, or ease of interaction. Logs cannot prove enjoyment. Agent task completion cannot establish human comprehension or learning. Separate observations, diagnoses, hypotheses, and unknowns; never invent tests, observations, users, or outcomes.

For meaningful Critic findings, record intended versus observed quality, evidence, likely diagnosis, minimum intervention, severity (Critical/High/Medium/Low), and confidence with limitations. A supported PASS is a valid result; the Critic need not discover defects or add features. Protect deliberate simplicity, ambiguity, difficulty, and visual style where approved; assess whether execution serves that intent.

The PM triages findings within scope. Allow at most two autonomous experiential repair passes, rechecking affected functional and experiential criteria after each. Two is a ceiling, not a quota. Escalate remaining Critical/High failures, material PM/Critic disagreement, and defining decisions. Missing evidence calls for verification rather than speculative redesign. Nonblocking opportunities go to the review backlog and do not justify endless polish. Stop when the scoped criteria are met.

## Apps, games, students, and adults

Choose relevant checks rather than imposing this entire list on every change:

- **First useful experience:** Can a newcomer reach the main benefit or meaningful game decision without coaching? Observe hesitation and misunderstanding. Set a product-appropriate target when evidence supports one, not a universal stopwatch rule.
- **Recovery and return:** Check a plausible mistake, interruption, empty state, failure, and resume path. Can the person recover without losing work or progress? Include offline behavior when promised or central to use.
- **Audience and device:** Identify likely reading familiarity, session length, device, input method, and environment. Test important flows on representative conditions when available; disclose substitutes. Design for students and ordinary adults without assuming expert vocabulary or endless attention.
- **Accessibility and clarity:** Include readable text, understandable labels, useful focus/input behavior, adequate contrast, and alternatives to color-only or sound-only essential information where applicable. Consider text scaling and reduced motion when relevant. Work accessibility into normal acceptance, not a last-minute polish phase.
- **Educational products:** Check factual accuracy and the intended reasoning outcome. Observe whether a learner can explain a choice or apply it to a new example; completing steps alone is insufficient evidence of learning. Consider teacher setup, classroom time, and recovery when those are part of the product.
- **Games:** Observe control response, feedback, readability of consequences, pacing, and meaningful choices against approved creative intent. Preserve intentional mystery without accidentally concealing information needed to act. These are review questions, not permission to redesign or prescribe a genre style.
- **Everyday utility apps:** Examine the complete core task, time and effort saved, trustworthy results, and returning use. Product and support copy must match actual capability and pricing. Purchase, restore, and cancellation information should be understandable where applicable.
- **Real people at milestones:** Propose a small, focused observation with intended users for uncertain human outcomes. Record what happened, assistance required, and limitations; small samples are directional, not statistical proof. Do not recruit, contact people, collect personal data, or claim user testing without authorization and actual evidence. Use synthetic data for routine checks involving student or personal records.

## Durable decisions and commercial learning

Keep one concise project experience record in existing documentation: audience/context, approved qualities with concrete examples, constraints, dated owner decisions, and known evidence gaps. Update it when decisions change; do not generalize one accepted exception into a universal rule. Reference it in work orders and preserve project-specific protocols that implement this policy.

At meaningful milestones, report the functional result, experiential result, evidence limitations, blocking issues, deferred suggestions, and any owner decision needed. Passing both tracks establishes readiness within reviewed scope; it does not claim final creative acceptance, release authorization, or commercial viability.

Track commercial questions separately at product milestones: who benefits, why they choose/pay, how they discover it, and delivery/support costs. Use observed sales and usage when available. Do not add analytics, subscriptions, growth features, or new work solely to satisfy this policy. Favor the smallest useful release and sustainable maintenance over extra features.
