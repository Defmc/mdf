#!/bin/sh
[ ! -z "$DISPLAY" ] && export EDITOR=$(xrdb -get "apps.editor")
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="lambda"

export plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source "$HOME/.cargo/env"
source "$ZSH/oh-my-zsh.sh"
source <(fzf --zsh)

HISTFILE="~/.zshrc"
HISTSIZE=10000
