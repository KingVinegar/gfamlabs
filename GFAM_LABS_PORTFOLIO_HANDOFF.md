# GFAM Labs — Portfolio and Operating Handoff

**Prepared:** 2026-09-08
**Audience:** the next GFAM Labs lead or local implementation agent
**Owner:** the Designer; final authority on product intent, taste, scope, and creative acceptance

## Read this first

GFAM Labs is a small-app studio pursuing focused, premium consumer products that can earn meaningful niche revenue without competing head-on with large feature-catalog companies.

The operating thesis is:

> Build a small, opinionated product for a high-intent moment that a large competitor will not serve with the same clarity, taste, or operating simplicity.

"Small market" is not enough. A project must have a precise moment of need, reachable audience, paid job, interaction/content/taste advantage, sustainable support burden, and credible trust boundary.

Read [AGENTS.md](AGENTS.md) and [SCHOOL_MAC_LOCAL_DEVELOPMENT_PROTOCOL.md](SCHOOL_MAC_LOCAL_DEVELOPMENT_PROTOCOL.md) before taking action. Then read only the documentation directly relevant to the assigned project. Do not scan the whole repository merely because it is available.

## Authority and gates

- The owner is the Designer. Treat names, character/voice, visual direction, pricing, positioning, public claims, scope expansion, and release approval as owner decisions unless expressly delegated.
- Do not publish, submit to App Store Connect, spend money, create accounts, contact people, send campaigns, enable analytics, use external API keys, or access personal/school data without explicit owner authorization at the point of action.
- Preserve existing untracked work. Stage and commit only files within the assigned project plus expressly authorized root documents.
- Surface a conflict rather than silently replacing an intentional creative constraint with generic "best practice."
- Agent judgment and Simulator/build evidence are not user testing, proof of comprehension, or commercial validation.

## Current portfolio decision

| Project | Decision | Why | Authorized near-term work |
| --- | --- | --- | --- |
| **EmberEats** | Lead live product | The only published app with real use and about $100 in reported revenue. | Improve the trip-specific planning outcome: meals that work for gear, people, weather, and constraints. Obtain App Store Connect evidence before broad growth work. |
| **Kitchen Coach** (working label) | Lead new-product discovery/build | Strong fit with the owner's game-design background; teaches cooking judgment before real stakes. | Native iOS vertical slice only. See `kitchen-coach/MAC_LOCAL_AGENT_HANDOFF.md`. |
| **Baby Eats** | Conditional secondary bet | The "one safe food today" promise is simpler than broad feeding suites, but has a high trust burden. | Do not expand until a named source protocol and authorized expert/content review plan exist. |
| **NailMuse** | Paused; rework only | Generic AI nail generation is crowded and the current allowance/price is economically unsafe. | If reactivated, validate a finite salon brief/DIY recipe outcome; no generic image subscription. |
| **BarCart** | Paused as built | Generic home-bar catalog/inventory apps are in a feature arms race. | Retain content only. A future gameful craft-learning concept must validate as a separate promise. |
| **GuildGrow** | Paused as built | Generic garden/permaculture planners already have strong feature-rich competitors. | Retain insight/content only. A future first-bed or first-guild decision game must validate separately. |

## Portfolio non-bets

Do not build these without a new owner-approved discovery brief:

- Whole-trip camping planners, gear trackers, packing-list systems, or campsite journals.
- Comprehensive garden planners, crop databases, or generic permaculture planners.
- Generic home-bar inventory or cocktail finders.
- Generic D&D/5e GM tools, compendiums, or encounter managers.
- Salon booking platforms or generic AI nail-image subscriptions.
- Broad education products whose principal promise is "AI answers questions."

## Kitchen Coach: current priority

Kitchen Coach is a native iOS guided-practice game for home cooks who can follow recipes but cannot yet confidently diagnose, adapt, or recover a dish. Its promise:

> Practice the cooking calls that recipes and cooking shows skip, before dinner depends on them.

The relevant inspiration from Dr. Wolf is the coaching structure: meaningful play, in-context guidance, focused training, revisiting past mistakes, and visible growth—not its character, language, branding, or chess mechanics.

The first mobile vertical slice is **The Quiet Stew**. A stew has good texture and aroma but tastes bland; the learner identifies the likely issue, chooses a response under a time constraint, sees the outcome and trade-off, and receives gentle explanation/recovery. The slice must establish that good cooking choices are conditional rather than magic answers.

The local Mac agent may work only in `kitchen-coach/`. Its detailed boundary and build brief are in:

- [Kitchen Coach local-agent boundary](kitchen-coach/AGENTS.md)
- [Kitchen Coach Mac handoff](kitchen-coach/MAC_LOCAL_AGENT_HANDOFF.md)
- [Kitchen Coach product brief](KITCHEN_COACH_PRODUCT_BRIEF.md)
- [Kitchen Coach work order](KITCHEN_COACH_WORK_ORDER.md)

No backend, account, analytics, recipe import, AI feature, content platform, payment system, or external service belongs in the first slice.

## Required operating workflow

Apply a proportional two-track review to each substantial task.

1. **Work order.** State the person/problem, smallest useful result, constraints, acceptance criteria, exclusions, verification setup, and owner-reserved decisions before substantial work.
2. **Bounded assignment.** One project/area and one writer at a time. Record requested model, reasoning level, worker count, scope, checks, and exclusions. If runtime/model selection cannot be verified, record **UNVERIFIED**; do not imply it was selected.
3. **Functional evidence.** Run the smallest relevant check first: static check, focused test, Simulator path, or build. Test an actual complete flow where applicable, including a plausible mistake, recovery, return, and completion.
4. **Experiential evidence.** For a substantial player-facing change, an independent read-only Critic should inspect the running experience, screenshot/recording, or realistic task flow. The Critic is separate from the implementer. Agent review is not audience evidence.
5. **Repair limit.** At most two autonomous experience-repair passes. Recheck affected criteria after each. Escalate remaining Critical/High problems, material disagreement, missing evidence, or owner-reserved decisions.
6. **Handoff.** Report changed files, revision, checks, functional status, experiential status, evidence limits, deferred work, and any owner decision required.

For each applicable criterion use **PASS**, **FAIL**, or **NOT EVALUATED**. A screenshot does not establish ease, timing, learning, or enjoyment. Logs do not establish comprehension. Never manufacture observations or test participants.

## Model and cost routing

- Lead: `gpt-5.6-terra`, normally medium reasoning.
- Bounded implementation/docs/testing: `gpt-5.6-luna`, normally low or medium reasoning.
- Difficult iOS integration, build, signing, or release stabilization: `gpt-5.6-sol`.
- Exceptional architecture or unresolved consequential decisions: `gpt-6-astra` only when warranted.

Before a broad, multi-agent, build-heavy, or materially uncertain effort, perform a cost preflight. State cost uncertainty, planned models/workers, main cost drivers, and lower-cost staged option; obtain an owner choice before starting a high-cost path. The current runtime selection in this handoff is **UNVERIFIED**.

## School-owned Mac boundary

The school Mac may be used only for GFAM Labs development that complies with its device/acceptable-use policies. The local agent must:

- Work in one assigned GFAM project directory at a time, reading only its directly relevant root/project documentation.
- Never access data outside the GFAM checkout: school, personal, system, browser, cloud, email, calendar, contacts, photos, notes, or messaging data are out of scope.
- Never widen scope using parent traversal, symlinks, broad filesystem scans, or remote control from another computer.
- Avoid installation, extensions, packages, background services, VPNs, system configuration, accounts, and network calls unless the owner explicitly approves the precise action and school policy permits it.
- Use the iOS Simulator first. Apple account login, device signing, TestFlight, App Store Connect, and distribution require separate owner authorization.

The PC is the portfolio/product-control workspace. The Mac is a local Xcode/Simulator host. The owner-selected private GFAM Git repository is the sole synchronization route. The Mac agent should return source-control handoffs; it should not access the rest of the Mac.

## Evidence and commercial-learning priorities

### EmberEats

Before major feature or marketing work, inspect owner-provided App Store Connect evidence: acquisition source, conversion, purchases, retention/use proxy, search terms, ratings/reviews, and geography. The next product question is whether a sharper trip-planning message improves discovery and conversion—not whether to add a generic recipe catalog.

### Kitchen Coach

Before building a full library, establish that the small scenario loop feels like authentic, useful rehearsal rather than a flashcard. Keep every culinary claim conditional, sourced, and editorially reviewed before any public release. Food safety/allergen claims require especially careful boundaries.

### Baby Eats

Do not make safety, nutrition, or medical-style assurances. A source protocol and authorized expert/content review are prerequisites to launch work.

### NailMuse

If revisited, measure actual image generation, moderation, support, and store-fee cost before setting any recurring allowance. The desired paid outcome is a reproducible creative brief, not endless generic inspiration.

## Existing documentation and status

- `PORTFOLIO_MARKET_ASSESSMENT.md` — market scan and project recommendations. It is informative, not a release authorization.
- `PORTFOLIO_MARKET_WORK_ORDER.md` — market-assessment work order.
- `KITCHEN_COACH_PRODUCT_BRIEF.md` and `KITCHEN_COACH_WORK_ORDER.md` — approved discovery frame for the cooking vertical slice.
- `SCHOOL_MAC_LOCAL_DEVELOPMENT_PROTOCOL.md` — detailed cross-project school-Mac operating boundary.

The current repository contains significant untracked project content. It belongs to the owner and is not automatically in scope. Do not clean up, stage, commit, delete, or restructure it without a specific owner request.

## Initial task for the Mac agent

1. Confirm it is operating in `kitchen-coach/` only and that Xcode is already installed/available under school policy.
2. Read the Kitchen Coach local handoff and establish a minimal native SwiftUI project only if no prohibited installation, account, signing, or network action is needed.
3. Implement one complete Quiet Stew flow and one plausible mistaken-choice recovery path.
4. Run the smallest Simulator check available and report results with the evidence limits above.
5. Stop for owner review before branding, broader content, external services, App Store work, or any scope expansion.
