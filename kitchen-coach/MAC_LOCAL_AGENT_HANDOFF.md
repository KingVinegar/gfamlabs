# Kitchen Coach — Mac Local-Agent Handoff

**Prepared:** 2026-09-08
**Host:** school-owned Mac
**Authorized workspace:** this `kitchen-coach` directory only

## Mission

Build a native iOS vertical slice for a cooking judgment game. It helps capable home cooks rehearse real kitchen decisions before the stakes are real: an expensive roast, a time-sensitive dinner, or a dish that has gone off plan.

The product is not a recipe catalogue, generic chatbot, culinary certification, or trivia deck. Its promise is:

> Practice the cooking calls that recipes and cooking shows skip, before dinner depends on them.

## Product direction

The coaching inspiration is the *structure* of Dr. Wolf: make a real decision in context, receive patient in-the-moment coaching, revisit a mistake later, and develop visible judgment over time. Do not copy its character, wording, visual identity, or chess mechanics.

The desired coach is observant, specific, patient, and non-punitive. A poor choice should lead to a useful explanation and a recoverable next move—not a red X or a shaming score.

## First vertical slice

**Campaign:** Balance
**Scenario:** The Quiet Stew

It is 6:20 p.m. A vegetable-and-beef stew has good texture, tender vegetables, and appealing aroma. On tasting, the cook says: "I like the flavors, but it tastes bland." Guests arrive at 7:00. Available ingredients include salt, lemon, tomato paste, stock concentrate, herbs, and butter.

The player should:

1. Understand the time, tools, and sensory clue.
2. Choose the likely diagnosis in plain language.
3. Choose an intervention.
4. See what that intervention changes and what it risks.
5. Receive a concise explanation of the cooking principle.
6. Recover gracefully if the first choice was not the best fit.

The learning objective is to distinguish under-seasoning from missing flavor complexity, and to understand that gradual salt adjustment can increase perceived flavor rather than merely make food "saltier." Lemon may be a valid follow-up for lift, but it should not replace first establishing the seasoning baseline. Avoid claiming one universal answer; choices depend on goal and constraint.

## Initial build boundary

Build only enough to evaluate the core interaction:

- A launch/welcome moment that establishes guided practice.
- The Quiet Stew scenario.
- A gentle coach response for at least one best-fit path and one plausible-but-incomplete path.
- A result/explanation screen.
- A simple replay or "try a similar situation" route.

Do not add accounts, purchases, analytics, networking, backend services, recipe import, a content management system, a large scenario library, user-created content, or external AI.

## Owner-reserved decisions

Do not finalize any of these without asking the owner:

- Product name and coach identity.
- Visual direction and level of whimsy.
- Initial target skill level beyond the approved capable-beginner audience.
- Price, campaign-pack model, branding, or public claims.
- Apple signing, TestFlight, App Store Connect, external services, or distribution.

Use the temporary internal label **Kitchen Coach** and a neutral text-only coach until direction is approved.

## Mac operating rules

- Work only inside this directory. Do not inspect the rest of the GFAM repository or the Mac.
- Use the iOS Simulator first. Do not require Apple account login or device signing for the slice.
- Do not install anything. If Xcode is absent or incompatible, stop and report that fact.
- Keep network access disabled unless the owner specifically approves a named destination and purpose.
- Do not create or transmit credentials, tokens, screenshots containing unrelated Mac content, or user data.
- Keep every file, asset, and generated artifact local to this directory.

## Implementation preference

Use native SwiftUI with local static scenario data. Favor a small, readable state model over a generalized game engine. The visual goal is calm and tactile rather than flashy: clear food-state cues, readable choices, meaningful consequence, and gentle pacing.

The first build should compile and run in Simulator before visual embellishment. Test a complete path, a plausible mistake/recovery path, return/replay, Dynamic Type, Dark Mode, and reduced motion as relevant.

## Required handoff back to the owner/PC task

After each bounded work pass, provide:

- Changed files.
- What was run or inspected.
- Functional result: **PASS**, **FAIL**, or **NOT EVALUATED**.
- Experiential result: **PASS**, **FAIL**, or **NOT EVALUATED**, with evidence limitation.
- Any content claims needing culinary editorial sourcing.
- Any owner decision or permission needed next.

## Evidence limitations

No runnable iOS prototype, independent Critic review, culinary editorial review, or intended-user observation exists yet. Do not imply otherwise.
