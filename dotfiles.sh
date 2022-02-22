#!/usr/bin/env bash

DOTFILES_ROOT="`pwd`"

link() {
  ln -fs "${DOTFILES_ROOT}/${1}" "${HOME}/${2}"
  echo "linked $1 to $2"
}

echo 'Symlinking dotfiles'
link "curlrc" ".curlrc"
link "zshrc" ".zshrc"
link "vimrc" ".vimrc"
link "tmux.conf" ".tmux.conf"
link "gitconfig" ".gitconfig"
link "gitignore_global" ".gitignore_global"
