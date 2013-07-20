# make zsh start up faster | update manually with doctor
DISABLE_AUTO_UPDATE="true"
# zsh configuration
ZSH=$HOME/.oh-my-zsh
# theme for prefix & suffix
ZSH_THEME="mayhem"
plugins=(git github autojump command-not-found rails3 bundler ruby)
source $ZSH/oh-my-zsh.sh

# custom functions for custom platforms
os=$(uname)

if [[ "$os" == "Darwin" ]]; then
  source $HOME/dotfiles/zsh/osx
elif [[ "$os" == "Linux" ]]; then
  source $HOME/dotfiles/zsh/ubuntu
fi

# functions for aliases
z_function() {
  cwd=$PWD
  while [[ ! -f "$cwd/Rakefile" && ! -f "$cwd/Gemfile" && ! -d "$cwd/app" && ! -d "$cwd/config" && ! -d "$cwd/db" && "$cwd" != "${HOME}/Workspace/SameSystem" ]]
  do
    cwd=${cwd%\/*}
  done
  (cd $cwd && zeus $*)
}

# aliases
alias z=z_function
alias zst="z start"
alias zs="z s"
alias zc="z c"
alias cc="z cucumber --f pretty"
alias hcc="HEADLESS=true z cucumber --f pretty"
alias zweep="rm .zeus.sock"
alias zsp="z rspec"
alias cs3="rails s -e cucumber -p 3333"
alias c3="cucumber --f pretty"
alias hc3="HEADLESS=true cucumber --f pretty"
alias colad="cola dag"
alias r="rake"
alias rg="rails generate"
alias rmig="rake db:migrate"
alias bi="bundle install"
alias be="bundle exec"
alias bu="bundle update"
alias c=cd
alias v=vim
alias doctor=doctor_function

alias g=g_function
alias gad='git add .'
alias gaa='git add -A'
alias gc='git commit'
alias gca='git commit -a'
alias gcaa='git commit -a --amend -C HEAD'
alias gcl='git clone'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob="gco -b"
alias gcv='git commit --verbose'
alias gd='git diff'
alias gdc='git diff --cached'
alias gf='g fetch'
alias gg='git lg'
alias gpoh='gp origin HEAD'
alias gpush='git push'
alias gpsuh='git push'
alias gpr='git pull --rebase'
alias grc='git rebase --continue'
alias git-nuke=git-nuke_function
alias gro=gro_function

gro_function() {
  git fetch
  git rebase origin/$1
}
# refs to Ben Orenstein
g_function() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}
git-nuke_function() {
  git branch -D $1 && git push origin :$1
}

alias dot='cd $HOME/dotfiles'
alias tk='tmux kill-session'
alias tm='tmux'
alias tss='mux ss'
alias tls='tmux ls'

# dotfiles accessors
alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc && source ~/.zshrc"
alias crc="vim ~/.custom && source ~/.custom"
alias tmx="vim ~/.tmux.conf"
alias muxss="vim ~/.tmuxinator/ss.yml"

# generate ctags
alias rtags="ctags -R"
alias gemtags="bundle show --paths | xargs ctags -R"

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
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# source PATH & workspace-specific settings
source $HOME/.custom
