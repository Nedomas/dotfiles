#!/usr/bin/env bash

DOTFILES_ROOT="`pwd`"

[[ -e "${HOME}/.oh-my-zsh/themes" ]] || mkdir -p "${HOME}/.oh-my-zsh/themes"

link() {
  ln -fs "${DOTFILES_ROOT}/${1}" "${HOME}/${2}"
  echo "linked $1 to $2"
}

echo 'symlinking dotfiles'
link "gemrc" ".gemrc"
# link "curlrc" ".curlrc"
# link "zsh/themes/mayhem.zsh-theme" ".oh-my-zsh/themes/mayhem.zsh-theme"
# link "zshrc" ".zshrc"
# link "vimrc" ".vimrc"
# link "vim" ".vim"
# link "tmux/tmux.conf" ".tmux.conf"
# link "gitconfig" ".gitconfig"
# link "gitignore_global" ".gitignore_global"
