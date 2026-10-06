# Terminal Architecture

## Ownership

The normal workstation workflow is Ghostty + shell + Neovim. tmux is retained, inactive configuration and is not required for that workflow.

| Surface | Responsibility |
| --- | --- |
| `ghostty/config.ghostty` | Terminal appearance, macOS Option-as-Alt, clipboard behavior, and terminal scrollback key table |
| `zsh/` and `bash/` | Shell startup, environment, current working directory, and workspace command bindings |
| `bin/workspace-picker` | Directory/file discovery and target selection |
| `neovim/nvim` | Editing, in-editor navigation, language tooling, and the production statusline |
| `tmux/.tmux.conf` and `bin/tmux-sessionizer` | Optional retained multiplexer/session configuration |

See [shell architecture](shell.md) for picker/functions/search-root behavior and [Neovim architecture](neovim.md) for editor ownership. Application/window routing belongs to [window management](window-management.md), not terminal session management.

## Ghostty and Shell Integration

Ghostty configures Catppuccin Mocha, MesloLG Nerd Font Mono, window padding, copy-on-select, and macOS Option-as-Alt. Its `Alt-V` key table owns terminal scrollback movement, search, clipboard actions, and the command palette. The configured `v` and `y` actions copy to the clipboard; this key table is not Neovim visual selection.

The shell owns workspace selection and persistent directory changes. Its `Ctrl-B` sequences run sourced workspace functions without creating tmux sessions. Neovim opens selected files and owns buffer editing; exiting it returns to the directory selected by its shell caller.

The workstation links `~/.config/ghostty/config.ghostty` to the repository file. Shell startup supplies environment variables and makes `bin/` helpers available. The named font, Ghostty, shell integrations, fzf, and Neovim are external prerequisites; they are not installed by this repository.

## Retained tmux Configuration

tmux is parked for optional use. Retention does not imply that it launches automatically or is part of the normal terminal workflow.

`tmux/.tmux.conf` contains pane/window bindings, popup session selection, copy mode, status styling, and plugin declarations. It initializes the external `tpack` command. `bin/tmux-sessionizer` selects or creates a target directory, derives a session name from its basename and path hash, creates a first window named `shell`, and attaches or switches to that session. It uses its own target-discovery path rather than the shell's workspace picker. Neovim also retains a `vim-tmux-navigator` integration spec.

`~/.tmux.conf` is linked to this checkout. Do not remove or deploy changes to these retained surfaces as a side effect of normal terminal documentation work.

## Validation

For a changed terminal behavior, verify the owning layer with a focused interaction: shell directory selection, opening/exiting Neovim, or Ghostty key-table entry/action/exit. Check terminal/application shortcuts separately from shell/editor mappings.

Read current links and prerequisites before any reload. Syntax checks alone do not establish terminal rendering or shortcut behavior; report when an interaction was not exercised. Retained tmux needs runtime validation only when a task explicitly changes or activates it. Such validation should use a separate server/socket and controlled configuration, accounting for plugin initialization and helper side effects.

No private planning checkout is needed to understand or use these configurations.
