#!/bin/sh
[ ! -z "$DISPLAY" ] && export EDITOR=$(xrdb -get "apps.editor")
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="lambda"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export DISABLE_FZF_AUTO_COMPLETION="false"

export plugins=(
    fzf-tab
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
)

source "$HOME/.cargo/env"
source "$ZSH/oh-my-zsh.sh"
