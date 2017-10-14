# Setup (windows only)

## Package Manager (chocolatey)
- powershell:

```bash
Set-ExecutionPolicy Bypass; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## Dependencies
- Install git

```bash
git for windows
-> no auto crlf
-> add unix tools to path
```

- Install [cygwin](https://www.cygwin.com/)
- Install packages:
    zsh curl wget

```bash
# add cygwin to path
setx path "%path%;c:\cygwin64\bin"
```

- Set home dir
```bash
vim /etc/nsswitch.conf
```
then add "db_home: windows"

- remove cygdrive prefix
```bash
vim /etc/fstab
```
```
then change
"none /cygdrive cygdrive binary,posix=0,user 0 0"
to
"none / cygdrive binary 0 0"
```

## Cmder

- Install [cmder](https://github.com/cmderdev/cmder/releases)
- Import settings from ./cmder/ConEmu.xml (in repo)


## Install

* Execute install.sh
* Set up Vundle
```sh
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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

