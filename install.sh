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
files="vimrc zshrc gitconfig gitignore_global xwinrc"

##########

echo "Installing oh-my-zsh..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "downloading oh-my-zsh"
  (
    cd $HOME
    git clone git://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
  )
  echo "oh-my-zsh installed."
else
  echo "oh-my-zsh already installed - skipping"
fi


# change to the dotfiles directory
echo "Changing to $dir directory"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
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

echo "Installing vim plugin manager Vundle..."
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  echo "downloading Vundle"
  (
    mkdir -p $HOME/.vim/bundle
    cd $HOME/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
  )
  echo "Vundle plugin installed."
else
  echo "Vundle plugin already installed - skipping"
fi

echo "Installing vim plugins..."
vim +PluginInstall +qall
echo "Vim plugins installed"

echo ""
echo "Successfully installed dotfiles!"
