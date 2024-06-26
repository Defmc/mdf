#!/bin/sh
[ ! -z "$DISPLAY" ] && export EDITOR=$(xrdb -get "apps.editor")
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="lambda"

export plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf-zsh-plugin)

source "$HOME/.cargo/env"
source "$ZSH/oh-my-zsh.sh"
