alias v=nvim
alias hg='history | grep'

alias t=tmux
alias ta="tmux attach"
alias tls='tmux ls'
alias td='tmux detach'

alias g=g_function
alias ga='git add'
alias gap='stty sane && git add --patch'
alias gaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gup='git pull origin $(git rev-parse --abbrev-ref HEAD)'

alias gm='git merge'
alias gl='git log'

alias gco='git checkout'
alias gcob='gco -b'
alias gdl='git diff --color=always | less -r'
alias gd='gdl'
alias gf='g fetch'
alias gpoh='git push origin HEAD'

alias gr='g reset'
alias gpick='g cherry-pick'
alias gs='g stash'
alias gss='g stash'
alias gsp='gs pop'
alias gsl='gs list'
alias e='exit'

# refs to Ben Orenstein
g_function() {
  if [[ $# > 0 ]]; then
    git $@
  else
    echo "-- $(git rev-parse --abbrev-ref HEAD)"
    git status --short
  fi
}

alias dot='cd $HOME/Developer/dotfiles'
alias dev='cd $HOME/Developer'

alias vrc='v ~/.vimrc'
alias brc='v ~/.bashrc && source ~/.bashrc'
alias zrc='v ~/.zshrc && source ~/.zshrc'
alias trc='v ~/.tmux.conf'

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
HISTCONTROL=ignoredups:ignorespace
COMPLETION_WAITING_DOTS="true"
export EDITOR='nvim'

eval "$(rbenv init - zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:/Users/domas/Library/Python/2.7/bin
export PATH=$(pyenv root)/shims:$PATH
export ANDROID_HOME=/Users/domas/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/domas/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Created by `pipx` on 2025-04-26 13:47:12
export PATH="$PATH:/Users/domas/.local/bin"

# bun completions
[ -s "/Users/domas/.bun/_bun" ] && source "/Users/domas/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
