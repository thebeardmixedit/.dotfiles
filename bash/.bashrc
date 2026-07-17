#!/usr/bin/env bash

[[ $- == *i* ]] || return

# Environment
export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"
export DOTFILESLOGS="$DOTFILES/.logs"

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"

# PATH
PATH="$DOTFILES/bin:$PATH"
PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
PATH="/Applications/Carbon Copy Cloner.app/Contents/MacOS:$PATH"
PATH="$PATH:$ANDROID_HOME/emulator"
PATH="$PATH:$ANDROID_HOME/platform-tools"

export PATH

source_file() {
    if [[ -r "$1" ]]; then
        source "$1"
    fi
}

# Core config
source_file "$DOTFILES/bash/.history"
source_file "$DOTFILES/bash/.aliases"
source_file "$DOTFILES/bash/.functions"
source_file "$DOTFILES/bash/.prompt"

# Shell behavior
shopt -s nocaseglob
shopt -s histappend
shopt -s cdspell

for option in autocd globstar; do
    shopt -s "$option" 2>/dev/null || true
done

# Homebrew completions
if [[ -n "${HOMEBREW_PREFIX:-}" ]]; then
    BASH_COMPLETION_COMPAT_DIR="$HOMEBREW_PREFIX/etc/bash_completion.d"

    if [[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
        source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
    fi
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git >/dev/null 2>&1; then
    complete -o default -o nospace -F _git g
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
if [[ -r "$HOME/.ssh/config" ]]; then
    complete -o default -o nospace -W "$(grep "^Host" "$HOME/.ssh/config" | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh
fi

# Add tab completion for `defaults read|write NSGlobalDomain`
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o nospace -W "Contacts Calendar Dock Finder Mail Safari Music SystemUIServer Terminal" killall

# Setup for zoxide
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
fi
