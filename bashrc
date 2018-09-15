# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

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

alias dot='cd $HOME/dotfiles'
alias dev='cd $HOME/Developer'

alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bashrc && source ~/.bashrc'
alias zrc='vim ~/.zshrc && source ~/.zshrc'
alias trc='vim ~/.tmux.conf'

# random prompt settings
export HISTFILESIZE=10000
export HISTSIZE=10000
export PROMPT_COMMAND='history -a'
COMPLETION_WAITING_DOTS="true"
# I dont make mistakes
# unsetopt correct_all
export EDITOR='vim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
