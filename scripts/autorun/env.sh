#!/bin/sh
export EDITOR="nvim"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source ~/.cargo/env
source $ZSH/oh-my-zsh.sh
