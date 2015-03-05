#!/usr/bin/env bash

DOTFILES_ROOT="`pwd`"

[[ -e "${HOME}/.oh-my-zsh/themes" ]] || mkdir -p "${HOME}/.oh-my-zsh/themes"

link() {
  ln -fs "${DOTFILES_ROOT}/${1}" "${HOME}/${2}"
  echo "linked $1 to $2"
}

echo 'symlinking dotfiles'
link "zshrc" ".zshrc"
link "vimrc" ".vimrc"
link "vim" ".vim"
link "tmux/tmux.conf" ".tmux.conf"
link "gitconfig" ".gitconfig"
link "gitignore_global" ".gitignore_global"
link "pryrc" ".pryrc"
