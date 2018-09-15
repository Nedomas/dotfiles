# make zsh start up faster | update manually with doctor
DISABLE_AUTO_UPDATE="true"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mayhem"
plugins=(git autojump)
source $ZSH/oh-my-zsh.sh

alias v=vim
alias hg='history | grep'

alias t=tmux
alias ta="tmux attach"
alias tls='tmux ls'
alias td='tmux detach'
alias takeover="tmux detach -a"

alias g=g_function
alias gad='git add .'
alias gau='git add . --update'
alias gap='stty sane && git add --patch'
alias gaa='git add -A'
alias gbr='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcl='git clone'
alias gcm='git commit -m'

alias gm='git smart-merge'
alias gl='git smart-log'

alias gco='git checkout'
alias gcob='gco -b'
alias gd='gdl'
alias gdl='git diff --color=always | less -r'
alias gf='g fetch'
alias gpoh='gp origin HEAD'

alias gr='g reset'
alias grhard='g reset --hard HEAD'
alias gpick='g cherry-pick'
alias gs='g stash'
alias gsp='gs pop'
alias gsl='gs list'

alias e='exit'

# refs to Ben Orenstein
g_function() {
  if [[ $# > 0 ]]; then
    git $@
  else
    echo "-- $fg[cyan]$(git rev-parse --abbrev-ref HEAD)"
    git status --short
  fi
}


alias dot='cd $HOME/dotfiles'
alias dev='cd $HOME/Developer'

alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc && source ~/.zshrc"

# random prompt settings
export HISTFILESIZE=10000
export HISTSIZE=10000
export PROMPT_COMMAND='history -a'
COMPLETION_WAITING_DOTS="true"
# I dont make mistakes
unsetopt correct_all
export EDITOR='vim'

export PATH="$HOME/dotfiles/bin:$PATH"

PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
