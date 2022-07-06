#!/bin/sh
export EDITOR="nvim"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"
#export RUSTC_WRAPPER="~/.cargo/cachepot"

export plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

. "$HOME/.cargo/env"
. "$ZSH/oh-my-zsh.sh"
