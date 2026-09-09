# GFAM Labs — School Mac Sandbox Verification

This checklist is required before opening a GFAM Labs local-agent task on the school-owned Mac. It applies to every GFAM project.

## What the checked-in configuration enforces

When the trusted GFAM repository or a protected project is opened in Codex, `.codex/config.toml` selects a custom permission profile that:

- denies local-command reads outside the active workspace, apart from the minimal operating-system/tool paths Codex needs;
- permits writes only inside the active workspace;
- denies command network access;
- denies reads of common credential and signing-file formats inside the workspace;
- disables Codex Apps/connectors, multi-agent work, remote plugin discovery, browser history, browser automation, and native-app computer use;
- uses on-request approvals and does not persist local chat history; and
- inherits the built-in workspace protection for `.git`, so the local agent cannot silently stage, commit, push, or rewrite Git state.

Codex permission profiles govern sandboxed local commands. They are not a whole-machine security system: they do not replace school policy, macOS account controls, or owner review, and do not govern work the owner performs manually outside Codex. See [official Codex permissions documentation](https://learn.chatgpt.com/docs/permissions).

## Owner setup — do this manually on the Mac

1. Confirm that use of Xcode and the private GFAM repository complies with school policy.
2. Pull `main` in `/Users/Steve.Gallo/Repos/gfamlabs` yourself, outside the local agent.
3. Open only the assigned project folder in Codex. For Kitchen Coach, open `/Users/Steve.Gallo/Repos/gfamlabs/kitchen-coach`, not the whole home directory or unrelated school folders.
4. Trust the project only after confirming the workspace path and reviewing its checked-in `.codex/config.toml` and `AGENTS.md`.
5. In Codex settings, leave browser/computer-use extensions disconnected or disabled. Do not enable a broad workspace, remote host, connector, MCP server, browser extension, or persistent app approval for this task.
6. Use Simulator-only work until you separately authorize Apple signing or physical-device activity. Do not sign in to App Store Connect or give the agent Apple-account access.
7. When a local pass is complete, inspect the diff yourself. Perform Git stage/commit/push yourself or explicitly authorize a narrowly scoped Git action in a separate task.

## Expected local-agent behavior

- It may edit the assigned project and run local, offline checks that fit the workspace-only profile.
- It must stop rather than widen permissions, enable networking, install dependencies, reach a local service, or request access to another folder/app.
- It reports the exact files changed plus functional and experiential evidence. It does not claim real-user testing.

## Fast verification

Before the first implementation pass, have the local agent report:

- the active workspace path;
- that `default_permissions` resolves to `gfam-workspace-only`;
- that command networking is disabled;
- that browser/computer-use/connectors are unavailable or disabled; and
- that it can read/write a harmless file in the assigned project but cannot access an unrelated path or modify Git internals.

If any condition differs, stop. Do not work around it; correct the local configuration or reduce scope first.
