# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
CYAN=$fg[cyan]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
RESET_COLOR=$reset_color

# Format for parse_git_dirty() & ahead()
ZSH_THEME_GIT_PROMPT_DIRTY="%{$RED%}"
ZSH_THEME_GIT_PROMT_AHEAD="%{$YELLOW%}"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$RED%}(!)"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$RESET_COLOR%}@%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER=""

MODE_INDICATOR="%{$YELLOW%}-- COMMAND --%{$RESET_COLOR%}"

# Prompt format
PROMPT='
%n@%m%{$RESET_COLOR%} %{$YELLOW%}$(prompt_ssh)%{$RESET_COLOR%}
%{$BLUE%}$(parse_git_dirty)$(git_prompt_ahead)>%{$RESET_COLOR%} '
RPROMPT='%~%u %{$CYAN%}$(current_branch)$(git_prompt_short_sha)%{$RESET_COLOR%}$(git_cwd_info)'
