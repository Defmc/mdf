#!/bin/sh
[ ! -z "$DISPLAY" ]
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="lambda"
export DISABLE_FZF_AUTO_COMPLETION="false"
export MANPAGER="bat -l man -p"
export EDITOR="nvim"

export plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
)

export PATH="$PATH:/home/me/.local/bin"

source "$HOME/.cargo/env"
source "$ZSH/oh-my-zsh.sh"

eval "$(zoxide init zsh)"
