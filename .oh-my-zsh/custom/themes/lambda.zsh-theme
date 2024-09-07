PROMPT="%(?:%{$fg_bold[green]%}%1{λ%}:%{$fg_bold[red]%}%1{λ%}) %{$fg[blue]%}"
PROMPT+='%~/ $(git_prompt_info)'
PROMPT+="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
