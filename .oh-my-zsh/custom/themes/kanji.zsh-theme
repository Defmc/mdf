#!/bin/sh

PROMPT="%{$fg_bold[cyan]%}%~%f"
PROMPT+=' $(git_prompt_info)'
PROMPT+="%(?:%{$fg_bold[blue]%}%1{鈴%} :%{$fg_bold[yellow]%}%1{鈴%} )%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}󰘬 %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
