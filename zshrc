# make zsh start up faster | update manually with doctor
DISABLE_AUTO_UPDATE="true"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mayhem"
plugins=(git autojump vi-mode)
source $ZSH/oh-my-zsh.sh

# custom functions for custom platforms
os=$(uname)

if [[ "$os" == "Darwin" ]]; then
  source $HOME/dotfiles/zsh/osx
elif [[ "$os" == "Linux" ]]; then
  source $HOME/dotfiles/zsh/ubuntu
fi

# aliases
alias z=zeus
alias zst="z start"
alias zs="z s thin"
alias zc="z c"
alias cc="z cucumber --f pretty"
alias hcc="HEADLESS=true z cucumber --f pretty"
alias zweep="rm .zeus.sock"
alias zsp="z rspec"
alias cs3="rails s -e cucumber -p 3333"
alias ccs3="CACHE_CLASSES=false cs3"
alias css3="CACHE_CLASSES=false cs3"
alias c3="bundle exec cucumber --f pretty"
alias hc3="HEADLESS=true bundle exec cucumber --f pretty"
alias colad="cola dag"
alias r="rake"
alias rg="rails generate"
alias rmig="rake db:migrate"
alias skeleton="rake test:migrations RAILS_ENV=testing_skeleton"
alias roll="rake db:rollback"
alias rs="rails s"
alias rt="rake routes"
# alias rs="rails s thin"
# alias rs="passenger start"
alias rc="rails c"
alias bi="bundle install"
alias be="bundle exec"
alias bu="bundle update"
alias c=cd
alias v=vim
alias doctor=doctor_function
alias flap='flog $(find app -name \*.rb)'

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

alias g=g_function
alias d='gd'
alias gad='git add .'
alias gau='git add . --update'
alias gap='git add --patch'
alias gaa='git add -A'
alias gbr='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcaa='git commit -a --amend -C HEAD'
alias gcl='git clone'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='gco -b'
alias gcv='git commit --verbose'
alias gd='git diff'
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
alias grhard='g reset --hard HEAD'
alias gpick='g cherry-pick'
alias gard='g reset --hard'
alias goft='g reset'

alias gphm='gp heroku master'

# git-smart gem
alias gu='git smart-pull'
alias gm='git smart-merge'
alias gl='git smart-log'
alias gcon='git diff --name-only --diff-filter=U'
alias glast='gcon | head -1'

# ss backup
alias lb='time load-backup -v'

alias e='exit'
alias q='exit'
alias flux='xflux -l 54.7 -g 25.3'

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
alias pa='cd $HOME/Developer/pathoscope'
alias s='cd $HOME/Developer/samesystem'
alias pa='cd $HOME/Developer/pathoscope'
alias tk='tmux kill-session'
alias t='tmux'
alias tls='tmux ls'

alias cdl='cap to_live deploy'
alias cdm='cap to_test deploy'

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
