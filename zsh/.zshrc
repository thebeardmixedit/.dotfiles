#!/usr/bin/env zsh

# # Auto-start tmux if not already in a session and not non-interactive
# if [[ -z "$TMUX" ]] && [[ $- == *i* ]]; then
#     tmux attach-session -t default 2>/dev/null || tmux new-session -s default
# fi

# Custom startup banner
# Keep this above the Powerlevel10k instant prompt block.
show_startup_banner() {
    # Catppuccin Mocha ANSI foreground colors
    local ctp_reset=$'\e[0m'

    local ctp_rosewater=$'\e[38;2;245;224;220m'
    local ctp_flamingo=$'\e[38;2;242;205;205m'
    local ctp_pink=$'\e[38;2;245;194;231m'
    local ctp_mauve=$'\e[38;2;203;166;247m'
    local ctp_red=$'\e[38;2;243;139;168m'
    local ctp_maroon=$'\e[38;2;235;160;172m'
    local ctp_peach=$'\e[38;2;250;179;135m'
    local ctp_yellow=$'\e[38;2;249;226;175m'
    local ctp_green=$'\e[38;2;166;227;161m'
    local ctp_teal=$'\e[38;2;148;226;213m'
    local ctp_sky=$'\e[38;2;137;220;235m'
    local ctp_sapphire=$'\e[38;2;116;199;236m'
    local ctp_blue=$'\e[38;2;137;180;250m'
    local ctp_lavender=$'\e[38;2;180;190;254m'

    local ctp_text=$'\e[38;2;205;214;244m'
    local ctp_subtext1=$'\e[38;2;186;194;222m'
    local ctp_subtext0=$'\e[38;2;166;173;200m'

    local ctp_overlay2=$'\e[38;2;147;153;178m'
    local ctp_overlay1=$'\e[38;2;127;132;156m'
    local ctp_overlay0=$'\e[38;2;108;112;134m'

    local ctp_surface2=$'\e[38;2;88;91;112m'
    local ctp_surface1=$'\e[38;2;69;71;90m'
    local ctp_surface0=$'\e[38;2;49;50;68m'

    local ctp_base=$'\e[38;2;30;30;46m'
    local ctp_mantle=$'\e[38;2;24;24;37m'
    local ctp_crust=$'\e[38;2;17;17;27m'

    _startup_print_right() {
        local right_color="$1"
        local right_message="$2"
        local left_message="${3:-}"
        local left_color="${4:-$right_color}"
        local width="${COLUMNS:-80}"

        local left_length="${#left_message}"
        local right_length="${#right_message}"
        local padding

        if [[ -n "$left_message" ]]; then
            padding=$((width - left_length - right_length))
            ((padding < 1)) && padding=1

            printf "%s%s%s%*s%s%s%s\n" \
                "$left_color" \
                "$left_message" \
                "$ctp_reset" \
                "$padding" \
                "" \
                "$right_color" \
                "$right_message" \
                "$ctp_reset"
        else
            padding=$((width - right_length))
            ((padding < 0)) && padding=0

            printf "%s%*s%s%s\n" \
                "$right_color" \
                "$padding" \
                "" \
                "$right_message" \
                "$ctp_reset"
        fi
    }

    print -r -- "$ctp_blue"
    cat <<'EOF'
 _____ _        ___                  _ 
|_   _| |_  ___| _ ) ___ __ _ _ _ __| |
  | | | ' \/ -_) _ \/ -_) _` | '_/ _` |
  |_| |_||_\___|___/\___\__,_|_| \__,_|
EOF

    echo
    _startup_print_right \
        "$ctp_mauve" \
        "Welcome back my guy. Lock in." \
        "  terminal initialized... system ready to cook....." \
        "$ctp_subtext0"
    echo
}

if [[ $- == *i* ]]; then
    show_startup_banner
fi

unfunction show_startup_banner _startup_print_right 2>/dev/null

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zle_highlight=('paste:none')

# Environment exports
export CODE="$HOME/Code"
export DOTFILES="$HOME/.dotfiles"
export DOTFILESLOGS="$DOTFILES/.logs"
export NEOVIM="$DOTFILES/neovim"

# PATH exports
export ANDROID_HOME="$HOME/Library/Android/sdk"

typeset -U path PATH

path=(
    "$DOTFILES/bin"
    "$HOME/.local/share/bob/nvim-bin"
    "/Applications/Carbon Copy Cloner.app/Contents/MacOS"
    $path
    "$ANDROID_HOME/emulator"
    "$ANDROID_HOME/platform-tools"
)

# Source a file if it is readable.
source_file() {
    if [[ -r "$1" ]]; then
        source "$1"
    fi
}

# Import history, aliases, and functions.
source_file "$DOTFILES/zsh/.history"
source_file "$DOTFILES/zsh/.aliases"
source_file "$DOTFILES/zsh/.functions"

# Autoload commands and functions
autoload -U zmv

# Setup for fzf key bindings and fuzzy completion
if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh)
fi

if [[ -n "${HOMEBREW_PREFIX:-}" ]]; then
    fpath=("$HOMEBREW_PREFIX/share/zsh-completions" $fpath)
fi

# Initialize completion after all completion paths are configured
autoload -Uz compinit
compinit

# Setup for zoxide
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# Key bindings
bindkey -s '^B^P' '^utmux-sessionizer -s "${CODE}" -e "${CODE}/personal" -e "${CODE}/neovim"^M'
bindkey -s '^B^B' '^utmux-sessionizer "${DOTFILES}"^M'
bindkey -s '^B^N' '^utmux-sessionizer -s "${NEOVIM}"^M'
bindkey -s '^B^L' '^uclear^M'

if [[ -n "${HOMEBREW_PREFIX:-}" ]]; then
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    source_file "$HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"
    source_file "$DOTFILES/zsh/.p10k.zsh"

    source_file "$HOME/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh"
    source_file "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
