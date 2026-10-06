# Dotfiles

> My personal macOS workstation configuration.

This repository contains the configuration, scripts, and tooling I use every day.

The focus is on building a workstation that is reliable, maintainable, and enjoyable to work in while documenting the decisions behind it as it evolves.

The repository centers on maintained workstation configuration. Retained optional configuration is identified in the subsystem documentation.

## Repository Map

- `bash/`, `zsh/`, and `bin/`: [shell architecture](docs/architecture/shell.md)
- `neovim/`: [production editor and development lab](docs/architecture/neovim.md)
- `ghostty/` and `tmux/`: [terminal workflow](docs/architecture/terminal.md)
- `karabiner/`, `aerospace/`, and `borders/`: [keyboard and window management](docs/architecture/window-management.md)
- `protools/` and `tbp/`: Pro Tools and Universal Audio workstation assets

See [AGENTS.md](AGENTS.md) for repository-specific execution and validation guidance.

## Project Authority

This public repository owns implemented configuration and stable architecture. Private project planning belongs to the separate `.dotfiles-internal` repository. When present, `internal/` is its optional private planning submodule; it is not required to use the public configuration or documentation.

## Installation

Automated installation is not currently supported.

There is no supported bootstrap or provisioning workflow. Subsystem documentation describes configuration ownership and prerequisites.

## License

MIT
