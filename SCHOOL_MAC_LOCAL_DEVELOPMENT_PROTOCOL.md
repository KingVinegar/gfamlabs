# GFAM Labs — School Mac Local Development Protocol

**Effective:** 2026-09-08
**Applies to:** every GFAM Labs project checked out on a school-owned Mac

## Purpose

Allow narrowly scoped GFAM Labs development on the Mac without turning it into a general agent host or exposing school, personal, or unrelated project data.

## Operating model

| Place | Responsibility |
| --- | --- |
| Primary PC task | Product direction, portfolio decisions, research, documentation, reviews, and owner communication. |
| School Mac | Local implementation and Simulator testing for one explicitly assigned GFAM project at a time. |
| Owner-selected private Git repository | The only synchronization path for approved GFAM project source and documentation. |

The school Mac must not be broadly controlled from the PC. The Mac-local agent works only in its assigned project directory and returns a source-control handoff.

## Setup before a Mac-local task

1. Confirm that school policy permits Xcode, the selected private GFAM repository, and the intended development activity.
2. Place only GFAM Labs source and related project documentation in the repository checkout.
3. Select a single project directory for the task and configure the agent's writable workspace to that directory.
4. Keep network access disabled unless the owner approves a named destination and purpose.
5. Use the iOS Simulator first. Apple account access, device signing, TestFlight, and distribution are separate owner-controlled actions.

## Hard boundary

The local agent must not access files or data outside the GFAM Labs repository, including school/personal documents, email, browser information, contacts, calendar, photos, cloud drives, or system settings. It must not install tools or services, widen filesystem permissions, add VPNs, open accounts, send information externally, or use credentials without explicit owner authorization at that point of action.

Within the GFAM repository, the agent reads only the assigned project plus root policy and directly relevant project documentation. It does not search, stage, or modify other apps merely because they are present in the checkout.

## Git rules

- Sync through the owner-selected GFAM repository only.
- Stage and commit only files within the assigned project plus an explicitly authorized shared-root document.
- Do not use broad staging commands or include unrelated untracked work.
- Use a clear commit message and report the exact commit to the primary task.

## Required end-of-pass handoff

- Assigned project and scope.
- Changed files and commit ID.
- Commands/builds/checks run.
- Functional status: **PASS**, **FAIL**, or **NOT EVALUATED**.
- Experiential status: **PASS**, **FAIL**, or **NOT EVALUATED**, with the evidence limitation.
- Any source/content, policy, permission, or owner decision required next.
