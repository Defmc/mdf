#!/bin/sh
export EDITOR=$(xrdb -get "apps.editor")
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"
export RUSTC_WRAPPER="sccache"

export plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source "$HOME/.cargo/env"
source "$ZSH/oh-my-zsh.sh"
