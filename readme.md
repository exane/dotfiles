## Install

* Execute install.sh
* Set up Vundle
```sh
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
* (windows only) convert vimrc and the content from Vundle.vim 
```sh 
$ find . -type f -exec dos2unix {} \; 
```
* Install Plugins
```sh
$ vim +PluginInstall +qall
```
* Build YouCompleteMe
```sh
$ cd ~/.vim/bundle/YouCompleteMe
$ ./install.py --clang-completer
```
