# Setup (windows only)

## Package Manager (chocolatey)
- powershell:

```bash
Set-ExecutionPolicy Bypass; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## Dependencies

```bash
# add cygwin to path
setx path "%path%;c:\cygwin64\bin;c:\cygwin64"
```

- Download [cygwin](https://www.cygwin.com/)
- Save setup-x86_64.exe in C:/cygwin64
- Run default settings once
- Install packages:
```
setup-x86_64 -qP git,zsh,curl,wget,vim,gvim,xinit,xorg-server,xlaunch,lua
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
"none / cygdrive binary,posix=0,user 0 0"
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

