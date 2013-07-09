# zsh configuration
ZSH=$HOME/.oh-my-zsh
# theme for prefix & suffix
ZSH_THEME="juanghurtado"
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

# aliases

alias z="zeus"
alias zst="zeus start"
alias zs="zeus s"
alias zc="zeus c"
alias cc="zeus cucumber --f pretty"
alias zweep="rm .zeus.sock"
alias zsp="zeus rspec"
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
