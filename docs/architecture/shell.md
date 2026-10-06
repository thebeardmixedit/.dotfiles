# Shell Architecture

## Purpose

The shell subsystem provides the interactive Bash and Zsh environments used across the workstation.

Zsh is the primary shell. Bash is maintained as a portable fallback and should mirror Zsh behavior where practical without forcing artificial parity.

## Directory Layout

```text
bash/
├── .aliases
├── .bash_profile
├── .bashrc
├── .functions
├── .history
└── .prompt

zsh/
├── .aliases
├── .functions
├── .history
├── .p10k.zsh
├── .zprofile
└── .zshrc

bin/
    User-facing executable commands.
```

## Zsh Startup Flow

```text
.zprofile
    initializes Homebrew environment

.zshrc
    startup banner
    Powerlevel10k instant prompt
    environment variables
    PATH
    history
    aliases
    functions
    fzf
    completion
    zoxide
    keybindings
    Powerlevel10k
    syntax highlighting
```

## Bash Startup Flow

```text
.bash_profile
    initializes Homebrew environment
    sources ~/.bashrc

.bashrc
    interactive shell guard
    environment variables
    PATH
    history
    aliases
    functions
    prompt
    shell options
    Bash completion
    zoxide
```

## Conventions

- Zsh is the primary interactive shell.
- Bash should mirror Zsh behavior where practical.
- Executable commands belong in `bin/`.
- Sourced support currently lives in the shell-specific files; there is no shared `lib/` directory.
- Interactive-only aliases and functions belong in the shell-specific files.
- Startup files own initialization order and should stay easy to scan.
- Shebangs remain in sourced files for editor and LSP filetype detection.
- `PATH` contains executable directories only.
- Homebrew environment initialization belongs in `.zprofile` and `.bash_profile`.
- Prompt configuration belongs in `.p10k.zsh` for Zsh and `.prompt` for Bash.

## Workspace Navigation

`bin/workspace-picker` owns target discovery and selection. Directory mode searches the direct children of each search root; file mode searches recursively. Search roots themselves are not results. Multiple `--search` roots and exclusions are supported. A new directory can be created from a query only when there is one search root. The picker prints the selected path; it cannot change its caller's working directory.

The sourced functions in `zsh/.functions` and `bash/.functions` own shell and editor actions:

- `workspace_cd` selects a directory and changes the current shell's directory.
- `workspace_edit` selects a file and opens it in Neovim, without changing the shell's directory.
- `workspace_projects` calls `workspace_cd` with shell-specific search arguments.
- `workspace_dotfiles` and `workspace_neovim` change to their configured root before calling `workspace_edit`.

Zsh's `workspace_projects` searches `$CODE` and excludes `$CODE/tmp`. Bash's version searches `$CODE/personal` and `$CODE/neovim`. These are the current configured roots, not a promise of identical coverage. Zsh defines `NEOVIM` as `$DOTFILES/neovim`; Bash defaults it to `$HOME/.config/nvim`.

The workspace shortcuts are `Ctrl-B Ctrl-P` (projects), `Ctrl-B Ctrl-B` (dotfiles), and `Ctrl-B Ctrl-N` (Neovim). Zsh uses `bindkey -s` to submit ordinary shell commands; Bash uses `bind -x`. The active Zsh bindings do not invoke the retained tmux sessionizer. See [terminal architecture](terminal.md) for its optional role.

## Deployment and Prerequisites

The current workstation links shell startup files into this checkout. Zsh and Bash then source support files from `$DOTFILES`, and add `$DOTFILES/bin` to `PATH`. Editing this repository can therefore change subsequent shell startup and helper behavior.

Homebrew initialization belongs to the login startup files. Powerlevel10k, completion support, fzf, zoxide, and syntax highlighting are external installations, with availability checks in startup where configured. Workspace selection requires `find` and `fzf`; file editing requires `nvim`. Finder helpers use macOS AppleScript. Individual commands in `bin/` have their own dependencies.

## Validation

For changes to shell files or helpers:

1. Run the matching parser (`zsh -n` or `bash -n`) on changed files. Use ShellCheck only for supported Bash/sh files and account for `.shellcheckrc`; it does not validate Zsh.
2. Exercise the changed picker behavior with temporary directories and explicit search roots. Check selection, cancellation, exclusions, and creation only where the change affects them.
3. Verify persistent directory changes in an ordinary interactive shell. Verify that editing a selected file leaves the shell in the root chosen by its caller.
4. Test startup or interactive bindings only in an authorized isolated session, then report whether the live shell was exercised. Sourcing startup can initialize tools and write caches.

Keep reusable shell behavior here; application-specific project requirements belong to their owning repositories.
