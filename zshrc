alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias v=vim
alias s=sc-im
alias sc=sc-im
alias hg='history | grep'

alias t=tmux
alias ta="tmux attach"
alias tls='tmux ls'
alias td='tmux detach'
alias to="tmux detach -a"

alias g=g_function
alias gad='git add .'
alias ga='git add'
alias gau='git add . --update'
alias gap='stty sane && git add --patch'
alias gaa='git add -A'
alias gbr='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcl='git clone'
alias gcm='git commit -m'
alias gup='git pull origin $(git rev-parse --abbrev-ref HEAD)'

alias gm='git merge'
alias gl='git log'

alias gco='git checkout'
alias gcob='gco -b'
alias gd='gdl'
alias gdl='git diff --color=always | less -r'
alias gf='g fetch'
alias gpoh='git push origin HEAD'

alias gr='g reset'
alias grhard='g reset --hard HEAD'
alias gpick='g cherry-pick'
alias gs='g stash'
alias gss='g stash'
alias gsp='gs pop'
alias gsl='gs list'
alias ys='yarn start'
alias yb='yarn build'
alias yi='yarn install'
alias pd='prisma deploy'
alias pdf='prisma deploy --force'
alias pg='prisma generate'

alias e='exit'
alias tt='timetip'
alias noise='play -v 0.1 -n synth brownnoise'

alias ys='yarn start'
alias yi='yarn install'
alias yb='yarn build'
alias pd='prisma deploy'
alias pg='prisma generate'

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

alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bashrc && source ~/.bashrc'
alias zrc='vim ~/.zshrc && source ~/.zshrc'
alias trc='vim ~/.tmux.conf'
alias h='cd ~/Developer/honestive'
alias c='cd ~/Developer/candour'
alias y=yarn
alias b='cd ~/Developer/bluepick/bluepick'
alias riv='cd ~/Developer/riviera'
alias ysd='y start:dev'
alias p=prisma

shopt -s histappend

HISTCONTROL=ignoredups:ignorespace
COMPLETION_WAITING_DOTS="true"
export EDITOR='vim'

eval "$(/opt/homebrew/bin/brew shellenv)"
