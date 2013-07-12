# zsh configuration
ZSH=$HOME/.oh-my-zsh
# theme for prefix & suffix
ZSH_THEME="mayhem"
plugins=(git github autojump command-not-found rails3 bundler ruby)
source $ZSH/oh-my-zsh.sh

# functions for aliases
boxstart_function() {
  VBoxManage startvm "$@" --type headless
}

gro_function() {
  git fetch
  git rebase origin/$@
}

boxgo_function() {
  boxstart_function Jenkins1
  boxstart_function Jenkins2
}

boxstop_function() {
  boxsoft_function Jenkins1
  boxsoft_function Jenkins2
}

boxsoft_function() {
  VBoxManage controlvm "$@" acpipowerbutton
}

boxhard_function() {
  VBoxManage controlvm "$@" poweroff
}

ubuntu_function() {
  sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoclean -y && sudo apt-get autoremove -y
}

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
alias zweep="rm .zeus.sock"
alias zsp="z rspec"
alias cs33="rails s -e cucumber -p 3333"
alias c33="cucumber --f pretty"
alias colad="cola dag"

alias gfe="g fetch"
alias gcob="gco -b"
alias gad="ga ."
alias gpoh="gp origin HEAD"
# f.e. "gro master" rebases from origin/master
alias gro=gro_function
# boxstart yourmachinenamegoeshere
alias boxstart=boxstart_function
alias boxgo=boxgo_function
alias boxstop=boxstop_function
# "soft" shutdown
alias boxsoft=boxsoft_function
# "hard" shutdown
alias boxhard=boxhard_function

alias ubuntu=ubuntu_function
alias sqlyog="wine ~/.wine/drive_c/Program\ Files\ \(x86\)/SQLyog/SQLyog.exe"
alias wtf="same; tail -f log/application.log"
alias pg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'
alias dot='cd $HOME/dotfiles'
alias tk='tmux kill-session'
alias tm='tmux'
alias tss='mux ss'
alias tls='tmux ls'

# Random prompt settings
export HISTFILESIZE=1000
export HISTSIZE=1000
export PROMPT_COMMAND='history -a'
COMPLETION_WAITING_DOTS="true"
# I dont make mistakes
unsetopt correct_all
# Fix zeus encoding error
export LC_ALL="en_US.UTF-8"

# source PATH & workspace-specific settings
source $HOME/.custom
export PATH=$PATH:$HOME/bin
export EDITOR='vim'
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
