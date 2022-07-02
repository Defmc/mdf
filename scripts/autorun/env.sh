#!/bin/sh
export EDITOR="nvim"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"
export RUSTC_WRAPPER="~/.cargo/cachepot"

export plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

. ~/.cargo/env
. "$ZSH/oh-my-zsh.sh"
