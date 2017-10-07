#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
# dotfiles directory"
dir="$HOME/dotfiles"

# list of files/folders to symlink in homedir
files="vimrc zshrc gitconfig gitignore_global"

##########

echo "Installing oh-my-zsh..."

if [ ! -d $HOME/.oh-my-zsh ]; then
  echo "downloading oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
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
  rm $HOME/.$file

  echo "Creating symlink from $dir/$file to .$file in $HOME"
  if [ $OSTYPE == "cygwin" ]; then
    cyg_dest=$(cygpath -w "$HOME/.$file")
    cyg_target=$(cygpath -w "$dir/$file")
    cmd /C "mklink /H $cyg_dest $cyg_target"
  else
    ln -s $dir/$file ~/.$file
  fi
done

echo ""
echo "Successfully installed dotfiles!"
