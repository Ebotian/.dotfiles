# ZSH theme based on the fishy theme, that ships with oh-my-zsh.
# Differs in two aspects:
# 1. full path is shown instead of abbreviated directories
# 2. user@machine is not shown for localhost, only in ssh sessions and inside
# docker containers

local user_color='blue'; [ $UID -eq 0 ] && user_color='red'
local return_status=" %{$fg_bold[red]%}%(?..%?)%{$reset_color%}"

if [[ -n "$SSH_CLIENT" ]]; then
  PROMPT='%n@%m %{$fg[$user_color]%}%~%{$reset_color%}%(!.#.$) '
elif [[ "$(grep docker /proc/1/cgroup)" ]]; then
  PROMPT='%n@docker %{$fg[$user_color]%}%~%{$reset_color%}%(!.#.$) '
else
  PROMPT='%{$fg[$user_color]%}%~%{$reset_color%}$(git_prompt_info)$(git_prompt_status)${return_status} %(!.#.$) '
fi 
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

#RPROMPT='${return_status}$(git_prompt_info)$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="<"
ZSH_THEME_GIT_PROMPT_SUFFIX=">"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[white]%}(dirty)"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[white]%}(clean)"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}(added)"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}(modified)"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}(deleted)"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}(renamed)"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}(unmerged)"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}(untracked)"
