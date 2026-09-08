# Project Kitchen Coach — Discovery Vertical Slice Work Order

**Date:** 2026-09-07
**Status:** Active discovery; no public release, spending, outreach, account setup, or publishing authorized by this work order.

## Problem and smallest useful outcome

People can enjoy cooking shows and follow recipes yet freeze when a real dish needs judgment. They need a low-stakes place to rehearse noticing, diagnosing, and responding before cooking an expensive or time-sensitive meal.

The smallest useful outcome is a self-contained, mobile-first vertical slice that lets a newcomer complete one coached cooking scenario, understand why one response fits its constraints better than alternatives, and optionally carry a small practical drill into their own kitchen.

## Approved intent and constraints

- Owner direction: a gentle, wise coaching presence in the spirit of Dr. Wolf's in-context teaching—not a recipe catalogue, a chatbot, or a trivia deck.
- The core promise is **practice judgment before the stakes are real**.
- The learner is a capable home cook who can follow a recipe but does not yet trust themselves to adapt or recover it.
- Decisions must be conditional and technically defensible. Avoid single "magic fixes" when several interventions have different trade-offs.
- Science is a payoff for a decision, not a lecture. Food safety, allergens, substitutions, and factual culinary claims need documented editorial sources before a public build.
- The product name, visual identity, coach character, monetization, cuisine sequence, and release scope remain owner decisions.

## Scope and exclusions

This sprint produces the product brief, one vertical-slice specification, and a source/editorial plan. Implementation begins only after the owner accepts the vertical-slice direction.

Excluded: recipe import, user-generated advice, AI cooking assistant, subscriptions, social features, professional certification claims, food-safety authority claims, publishing, paid acquisition, analytics, and a large content library.

## Acceptance

Functional:

- A specified scenario has clear setup, diagnosis choices, action choices, outcomes, recovery, and an explanation.
- The content model can represent a best-fit choice with credible alternatives and explicit trade-offs.
- Any factual statement that will appear in a public slice has an identified editorial-source requirement.

Experiential:

- A newcomer should understand the immediate kitchen problem and make a meaningful choice without being asked to know specialist vocabulary first.
- The coach should make a mistaken choice feel instructive and recoverable rather than punitive.
- The experience should feel like rehearsal for a real kitchen moment, not a multiple-choice lesson.

Evidence required before accepting a public-facing slice: runnable interaction on a representative phone-sized view, source review of every instructional claim, and an independent experiential review. Owner judgment and/or authorized intended-user observation is needed to establish comprehension or enjoyment; neither is available yet.

## Routing and verification record

- Requested lead: `gpt-5.6-terra`, medium reasoning.
- Current runtime/model: **UNVERIFIED**.
- Workers: 0. No delegation or spending authorized for this discovery pass.
- Critic: unavailable at this stage; no independent experience verdict is claimed.
- Planned first checks: structured scenario review, phone-sized prototype walkthrough, then independent Critic review when a runnable slice exists.

## School-Mac build-host boundary — owner decision 2026-09-08

The school-owned Mac is permitted only as a narrowly scoped local build-and-test host for Kitchen Coach and directly related iOS development. It is not a general agent host or a source of school data.

- Use one dedicated project folder containing only Kitchen Coach source, assets, and project-local documentation.
- Do not inspect, index, upload, search, or modify any other user, school, system, application, cloud, browser, email, calendar, contact, photo, or document data.
- Do not grant this PC broad remote control of the Mac. Coordinate through a selected source-control handoff and a separate Mac-local development task.
- Do not install software, browser extensions, background services, VPNs, or developer dependencies without the owner's explicit approval and confirmation that school policy permits them.
- Start with no backend, external API keys, analytics, account creation, or user data. Apple signing and distribution access remain manual owner-controlled actions.
- Keep the Mac task's sandbox limited to the dedicated project folder; network access and commands outside that folder require explicit review at the point of need.
- Before implementation, the owner confirms that creating the folder, using Xcode, and syncing the project through the selected private source-control route comply with the school's device and acceptable-use policies.
