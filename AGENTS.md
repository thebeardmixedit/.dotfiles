# Dotfiles repository guidance

This repository owns workstation configuration, integration, and stable architecture. Use the repository map in README.md and read the subsystem documentation relevant to the task.

Separate projects own their product implementation, releases, and backlogs. Application SDK and coding-style policy belong in their owning repositories.

## Configuration safety and validation

- Tracked files may be active configuration through symlinks, sourced files, PATH entries, or deployed output. Check the relevant source-to-active relationships before editing; tracked application assets are not necessarily deployed.
- Use isolation appropriate to the task. A separate worktree does not redirect live configuration links. Switching, reloading, or deploying active configuration must be within the authorized scope.
- Startup, build, and validation commands may install dependencies, write output or caches, launch applications, or invoke automation. Check their effects and use controlled test locations where needed.
- Follow the relevant subsystem validation guidance. For documentation changes, check references, factual accuracy, and the diff. State what was verified and any material limits.

## Private planning and Git

- `internal/` is the optional private `.dotfiles-internal` submodule for planning and project management. Public configuration and documentation must work without it. Read `internal/AGENTS.md` before using or changing private material.
- Do not publish private planning or personal account/security information in public files, issues, pull requests, or commit metadata without explicit authorization. Do not commit credentials or other secrets to either repository.
- Preserve unrelated work. Commit and push only with explicit authorization.
- The parent gitlink records a checkpoint, not necessarily current private planning. Inspect both repositories when relevant; identify the private revision used and disclose unavailable evidence.
- Private repository changes do not authorize a parent pointer update. Such updates require explicit authorization. Review each repository’s changes separately and ensure the referenced private commit is available on the private remote before publishing the parent pointer.
