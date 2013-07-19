# make zsh start up faster | update manually with upgrade_oh_my_zsh
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

gro_function() {
  git fetch
  git rebase origin/$@
}

gg_function() {
  git commit -a -v -m "$*"
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
alias bu="bundle update"
alias c=cd
alias v=vim
alias doctor=doctor_function

alias gs="gst"
alias gf="g fetch"
alias gcob="gco -b"
alias gad="ga ."
alias gpoh="gp origin HEAD"
alias gg=gg_function
# f.e. "gro master" rebases from origin/master
alias gro=gro_function

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
alias arc="vim ~/.ackrc"

# generate ctags
alias gctags="bundle show --paths | xargs ctags -R"

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
