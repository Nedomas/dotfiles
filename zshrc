### ZSH configuration
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="juanghurtado"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# The clean path is - /usr/local/heroku/bin:/usr/local/sbin:/Users/domas/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
eval "$(rbenv init -)"
alias pg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'
### By fuse 4x
export PATH="/usr/local/sbin:$PATH"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
### Node.js
export PATH="/usr/local/share/npm/bin:$PATH"

# Fix zeus encoding error
export LC_ALL="en_US.UTF-8"
