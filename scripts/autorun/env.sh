#!/bin/sh
[ ! -z "$DISPLAY" ] && export EDITOR=$(xrdb -get "apps.editor")
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="lambda"
export DISABLE_FZF_AUTO_COMPLETION="false"

export plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source "$HOME/.cargo/env"
source "$ZSH/oh-my-zsh.sh"
