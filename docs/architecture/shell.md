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
- Shared sourced support code belongs in `lib/`.
- Interactive-only aliases and functions belong in the shell-specific files.
- Startup files own initialization order and should stay easy to scan.
- Shebangs remain in sourced files for editor and LSP filetype detection.
- `PATH` contains executable directories only.
- Homebrew environment initialization belongs in `.zprofile` and `.bash_profile`.
- Prompt configuration belongs in `.p10k.zsh` for Zsh and `.prompt` for Bash.

## First-Pass Status

Completed:

- Zsh startup cleanup
- Bash startup cleanup
- PATH cleanup
- Homebrew initialization cleanup
- History cleanup
- Alias parity
- Function cleanup
- Bash prompt refresh
- Bash/Zsh architectural alignment

## Deferred Work

- Shared shell library organization
- Shared Catppuccin palette
- Centralized helper functions
- Advanced logging
- Generalized error handling
- Bootstrap integration
- Machine profiles
- Public onboarding documentation
