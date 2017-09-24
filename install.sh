#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
# dotfiles directory"
dir="$HOME/dotfiles"

# old dotfiles backup directory
olddir="$HOME/dotfiles_old"

# list of files/folders to symlink in homedir
files="vimrc gitconfig gitignore_global"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in $HOME"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv $HOME/.$file $olddir

    echo "Creating symlink to $file in home directory."
    if [ $OSTYPE == "cygwin" ]; then
      cyg_dest=$(cygpath -w "$HOME/.$file")
      cyg_target=$(cygpath -w "$dir/$file")
      cmd /C "mklink /H $cyg_dest $cyg_target"
    else
      ln -s $dir/$file ~/.$file
    fi
done
