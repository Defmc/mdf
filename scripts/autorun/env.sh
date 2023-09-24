#!/bin/sh
[ ! -z "$DISPLAY" ] && export EDITOR=$(xrdb -get "apps.editor")
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"

export PATH="~/scripts/:$PATH"

export plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

