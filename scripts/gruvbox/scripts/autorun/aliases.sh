#!/bin/sh

# System infos
alias mem='free --mega'

# User managment
alias keyboard='setxkbmap -model abnt2 -layout br -variant abnt2'

# Google Translate
alias pt2en='trans -t english -brief'
alias en2pt='trans -t portuguese -brief'

# Apps
alias hp="hyperfine"
alias ls="exa --icons --long"
alias cat="bat -p"
alias grep="rg"

# Git
alias gt="git log --graph --decorate --pretty=oneline --abbrev-commit --all"

# Debugging
alias gdb="gdb -q"
