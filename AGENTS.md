# Dotfiles execution map

This public repository owns implemented workstation configuration and stable architecture. Read README.md, then only the documentation relevant to the task:

- Shell startup/support: bash/, zsh/, bin/; docs/architecture/shell.md.
- Production Neovim and experimental lab: neovim/nvim and neovim/nvim-lab; docs/architecture/neovim.md.
- Terminal configuration: ghostty/, tmux/; docs/architecture/terminal.md.
- Keyboard/window integration: karabiner/, aerospace/, borders/, routing helpers in bin/; docs/architecture/window-management.md.
- Workstation application assets: protools/ and tbp/. Verify deployment destinations rather than assuming tracked assets are active.

## Execution and validation

- This checkout can be live configuration through symlinks, sourced files, PATH entries, and deployed output. Verify relevant relationships before editing.
- Use an isolated worktree in this same repository when isolation is needed. It does not redirect live configuration links. Do not switch, reload, or deploy active configuration outside the authorized scope.
- Follow subsystem validation guidance. Use matching syntax/static checks and focused behavior checks for implementation changes; check documentation links, factual accuracy, and diffs for documentation-only changes. Report evidence and limits.
- Startup and build commands may install dependencies, write caches/output, or launch applications. Use controlled test locations and inspect their effects before running them.
- Separate projects own their product architecture, implementation, releases, and backlogs. Dotfiles owns workstation integration. Keep application SDK/style policy project-local; keep Karabiner Config Builder, Neovim plugin, and SoundFlow product work in their owning projects.

## Private planning boundary

- When present, internal/ is the optional private .dotfiles-internal submodule for roadmap and project-management truth. Public configuration and documentation must work without it.
- Read internal/AGENTS.md before using private material. If it is unavailable, report the limitation and continue independent authorized public work; do not infer current planning or claim private milestone completion.
- Do not copy or summarize private planning into public files, issues, pull requests, commit messages, or other public outputs without explicit authorization.
- Actionable work defaults to the private repository. Public issue tracking is exceptional and must be explicitly chosen.
- The parent gitlink records a deliberate checkpoint, not the latest private state. Inspect both repositories when relevant and report the private revision used.
- Private changes do not authorize parent pointer changes. Synchronization is deliberate; preserve unrelated work, stage explicit paths, and inspect each repository's diff separately.
