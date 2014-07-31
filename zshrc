# make zsh start up faster | update manually with doctor
DISABLE_AUTO_UPDATE="true"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mayhem"
plugins=(git autojump)
source $ZSH/oh-my-zsh.sh

# custom functions for custom platforms
os=$(uname)

if [[ "$os" == "Darwin" ]]; then
  source $HOME/dotfiles/zsh/osx
elif [[ "$os" == "Linux" ]]; then
  source $HOME/dotfiles/zsh/ubuntu
fi

# aliases
alias z="be zeus"
alias zst="CHROME=true CACHE_CLASSES=false be zeus start"
alias zsth="CACHE_CLASSES=false be zeus start"
alias zs="be zeus s thin"
alias zc="be zeus c"
alias cc="CACHE_CLASSES=false be zeus cucumber --f pretty"
alias hcc="be zeus cucumber --f pretty"
alias zweep="rm .zeus.sock"
alias zsp="be zeus rspec --format documentation --color"
# alias rails="bin/rails"
alias krs="cat tmp/pids/server.pid | kill -9 "
alias cs3="be rails s -e cucumber -p 3333"
alias ccs3="CACHE_CLASSES=false cs3"
alias css3="CACHE_CLASSES=false cs3"
alias c3="CHROME=true bundle exec cucumber --f pretty"
alias hc3="bundle exec cucumber --f pretty"
alias colad="cola dag"
alias r="be rake"
alias rg="rails generate"
alias rmig="bundle exec rake db:migrate"
alias zrmig="zeus rake db:migrate"
alias skeleton="bundle exec rake test:migrations RAILS_ENV=testing_skeleton"
alias roll="bundle exec rake db:rollback"
alias zroll="zeus rake db:rollback"
alias rs="rails s"
alias rt="bundle exec rake routes"
alias todo="bash ~/dotfiles/bin/todo_app/todo.sh"
# alias rs="rails s thin"
# alias rs="passenger start"
alias rc="rails c"
alias bi="bundle install"
alias be="bundle exec"
alias bu="bundle update"
alias c=cd
alias vim="vim"
alias v=vim
alias doctor=doctor_function
alias flap='flog $(find app -name \*.rb)'
alias q=e

alias rsp='bundle exec rspec'
alias bsp='bin/rspec'
alias brake='bin/rake'
alias brmig='brake db:migrate'
alias broutes='bin/rake routes'
alias brs='bin/rails s'
alias brc='bin/rails c'

alias bower="noglob bower"
alias ks="karma start"
alias kss="ks --no-single-run"
alias kr="karma run"
alias h='history'
alias hgrep='h | grep'
alias hg='hgrep'

alias g=g_function
alias d='gd'
alias gad='git add .'
alias gau='git add . --update'
alias gap='stty sane && git add --patch'
alias gaa='git add -A'
alias gbr='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcaa='git commit -a --amend -C HEAD'
alias gcl='git clone'
alias gcm='git commit -m'

# Learn Spanish with commit messages
# git(){[[ "$@" = commit\ -m* ]]&&termit en es ${${@:$#}//./} -t;command git $@}

alias gco='git checkout'
alias gcom='gco master'
alias gcol='gco live'
alias gcob='gco -b'
alias gcv='git commit --verbose'
alias gd='gdl'
alias gdc='git diff --cached'
alias gdl='git diff --color=always | less -r'
alias gf='g fetch'
alias gg='git lg'
alias gpoh='gp origin HEAD'
alias gpush='git push'
alias gpsuh='git push'
alias gpr='git pull --rebase'
alias grc='git rebase --continue'
alias git-nuke=git-nuke_function
alias gro=gro_function
alias gr='g reset'
alias grhard='g reset --hard HEAD'
alias gpick='g cherry-pick'
alias gard='g reset --hard'
alias goft='g reset'
alias glog='glo'
alias gamend='gc --amend'
alias gs='g stash'
alias gsp='gs pop'

alias gphm='gp heroku master'

# git-smart gem
alias gu='git smart-pull'
alias gm='git smart-merge'
alias gl='git smart-log'
alias gcon='git diff --name-only --diff-filter=U'
alias glast='gcon | head -1'
alias z='thyme -d'
alias x='thyme -s'
alias c='thyme -b'
alias lol='lolcommits'

# ss backup
alias lb='time load-backup -v'

alias e='exit'
alias ex='exit'
alias q='exit'
alias flux='xflux -l 54.7 -g 25.3'
alias tdt='ssh -L 0.0.0.0:9225:localhost:9222 localhost -N'

alias replant='r db:drop; r db:create; r db:migrate; r db:seed'

gro_function() {
  git fetch
  git rebase origin/$1
}
# refs to Ben Orenstein
g_function() {
  if [[ $# > 0 ]]; then
    git $@
  else
    echo "-- $fg[cyan]$(git rev-parse --abbrev-ref HEAD)"
    git status --short
  fi
}
git-nuke_function() {
  git branch -D $1 && git push origin :$1
}

alias dot='cd $HOME/dotfiles'
alias dev='cd $HOME/Developer'
alias s='cd $HOME/Developer/samesystem'
alias p='cd $HOME/Developer/pathoscope'
alias mo='cd $HOME/Developer/movies'
alias tk='tmux kill-session'
alias t='tmux'
alias tls='tmux ls'
alias ta='t attach'
alias td='t detach'

alias cdl='be cap to_live deploy'
alias cdm1='be cap to_test1 deploy'
alias cdt1='cdm1'
alias cdt2='be cap to_test2 deploy'

alias cpath='cap production deploy'
alias takeover="tmux detach -a"

# dotfiles accessors
alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc && source ~/.zshrc"
alias crc="vim ~/.custom && source ~/.custom"
alias tmx="vim ~/.tmux.conf"

# generate ctags
alias gtags=gtags_function

# idea: automate with bundle install
gtags_function() {
  ctags -R -f app.tags .
  ctags -R -f gem.tags `bundle show --paths`
}

function prompt_ssh {
    if [ -n "$SSH_CLIENT" ]; then
        echo -n 'ssh'
    fi
}

# random prompt settings
export HISTFILESIZE=1000
export HISTSIZE=1000
export PROMPT_COMMAND='history -a'
COMPLETION_WAITING_DOTS="true"
# I dont make mistakes
unsetopt correct_all
# fix zeus encoding error
export LC_ALL="en_US.UTF-8"
export EDITOR='vim'

# source PATH & workspace-specific settings
source $HOME/.custom

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# ### For teamviewer
# export PATH="/home/domas/teamviewer:$PATH"
