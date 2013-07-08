#!/usr/bin/env bash

DOTFILES_ROOT="`pwd`"
BACKUP_DIR="$HOME/dotfiles_backup"

link() {
  if [[ -e "${HOME}/${2}" ]]; then
    [[ -e "$BACKUP_DIR" ]] || mkdir -p "$BACKUP_DIR"
    mv "${HOME}/${2}" $BACKUP_DIR
    echo "moved "${HOME}/${2}" to "${DOTFILES_ROOT}/${1}""
  fi

  ln -fs "${DOTFILES_ROOT}/${1}" "${HOME}/${2}"
  echo "linked $1 to $2"
}

echo 'symlinking dotfiles'
link "zshrc" ".zshrc"
link "vimrc" ".vimrc"
link "vim" ".vim"
