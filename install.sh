#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
# dotfiles directory"
set -e

dir="$HOME/dotfiles"

# list of files/folders to symlink in homedir
files_to_symlink="eslintrc vimrc zshrc gitignore_global iex.exs gitattributes"
files_to_copy="gitconfig"

# for cygwin: prefer cygwin binaries (especially git, because of path issues in git clone)
export PATH="/cygdrive/c/cygwin64/bin/:$PATH"

##########

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
  echo "oh-my-zsh installed."
else
  echo "Oh-my-zsh already installed - skipping"
fi

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  echo "Installing vim plugin manager Vundle..."
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  echo "Vundle plugin installed."
else
  echo "Vundle plugin already installed - skipping"
fi

# create symlinks from every file in $files into $HOME directory
for file in $files_to_symlink; do
  echo "Remove .$file from $HOME"
  rm $HOME/.$file || true

  echo "Creating symlink from $dir/$file to .$file in $HOME"
  if [ $OSTYPE == "cygwin" ]; then
    cyg_dest=$(cygpath -w "$HOME/.$file")
    cyg_target=$(cygpath -w "$dir/$file")
    cmd /C "mklink /H $cyg_dest $cyg_target"
  else
    ln -s $dir/$file ~/.$file
  fi
done

mkdir -p $HOME/dotfiles_old
for file in $files_to_copy; do
  d=$(date +%F)
  backup_file=".$file-$d"
  backup_dest="$HOME/dotfiles_old/$backup_file"
  dest="$HOME/.$file"

  if [ -f $dest ]; then
    echo "Backup file to $backup_dest"
    cp $dest $backup_dest
  fi

  echo "Copying .$file to $HOME"
  cp $file $HOME/.$file
done

echo "Installing vim plugins..."
PLUGIN_INSTALL=1 vim +PluginInstall +qall
echo "Vim plugins installed"

echo ""
echo "Successfully installed dotfiles!"
