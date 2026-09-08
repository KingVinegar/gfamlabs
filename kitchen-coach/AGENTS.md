# Kitchen Coach — School Mac Local-Agent Boundary

This directory is the entire authorized workspace for the local agent on the school-owned Mac.

## Allowed scope

- Create, read, modify, build, and test only Kitchen Coach source, local project assets, and documentation inside this directory.
- Use Xcode and the iOS Simulator only for Kitchen Coach.
- Read `MAC_LOCAL_AGENT_HANDOFF.md` before starting work.

## Deny by default

- Do not inspect, search, index, upload, modify, or summarize files outside this directory.
- Do not access school, personal, system, browser, cloud-storage, mail, calendar, contacts, photos, notes, messaging, or other application data.
- Do not follow symlinks or use parent-directory traversal to widen scope.
- Do not install software, extensions, packages, background services, VPNs, or developer dependencies without explicit owner approval and confirmation that school policy permits it.
- Do not create accounts, use API keys, contact external services, enable analytics, access App Store Connect, sign builds, submit releases, or publish anything.
- Network access is off by default. If a specific action needs it, stop and request approval with the exact destination and purpose.

## Git and handoff

- Treat this repository as the only approved synchronization route.
- Restrict Git actions to the current Kitchen Coach branch and files inside this directory, unless the owner explicitly expands scope.
- Never commit, stage, or alter unrelated repository files.
- Record any required owner decision in `MAC_LOCAL_AGENT_HANDOFF.md`; do not guess at name, coach character, visual identity, pricing, or release scope.

## Verification

- Prefer a small static or Simulator check before any broader build.
- Report functional and experiential evidence separately. Do not call agent inspection or Simulator use user testing.
- Stop after a blocked permission, policy ambiguity, or owner-reserved creative decision.

