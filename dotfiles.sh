#!/usr/bin/env bash

DOTFILES_ROOT="`pwd`"
BACKUP_DIR="$HOME/backup_dotfiles"

link() {
  if [[ -e "${HOME}/${2}" ]]; then
    [[ -e "$BACKUP_DIR" ]] || mkdir -p "$BACKUP_DIR"
    mv "${HOME}/${2}" $BACKUP_DIR
    echo "moved "${HOME}/${2}" to "${BACKUP_DIR}/${1}""
  fi

  ln -fs "${DOTFILES_ROOT}/${1}" "${HOME}/${2}"
  echo "linked $1 to $2"
}

echo 'symlinking dotfiles'
link "zshrc" ".zshrc"
link "vimrc" ".vimrc"
link "vim" ".vim"
link "tmux.conf" ".tmux.conf"
link "gitconfig" ".gitconfig"
link "bin/git_diff_wrapper" "bin/git_diff_wrapper"
link "zsh/themes" ".oh-my-zsh/themes"

# vim plugin manager
if [ ! -d $DOTFILES_ROOT/vim/bundle ]; then
  mkdir -p $DOTFILES_ROOT/vim/bundle
fi

if [ ! -e $DOTFILES_ROOT/vim/bundle/vundle ]; then
  echo "installing neobundle"
  git clone git://github.com/Shougo/neobundle.vim $DOTFILES_ROOT/vim/bundle/neobundle.vim
fi
