# Setup (windows only)

## Gvim
- [Gvim download](https://github.com/vim/vim-win32-installer)
- For dynamic interface libraries like lua, download the dll and put it into your PATH or alongside gvim.exe

## Package Manager (chocolatey)
- powershell:

```bash
Set-ExecutionPolicy Bypass; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## Dependencies

need git-for-windows for gvim usage
need git (cygwin) for using zsh
need vim (cygwin) for install process (plugins)


```bash
# add cygwin to path
setx path "%path%;c:\cygwin64\bin;c:\cygwin64"
```

- Download [cygwin](https://www.cygwin.com/)
- Save setup-x86_64.exe in C:/cygwin64
- Run default settings once
- Install packages:
```
setup-x86_64 -qP git,zsh,curl,wget,vim
```

- Set home dir
```bash
vim /etc/nsswitch.conf
```
then add "db_home: windows"

## Cmder

- Install [cmder](https://github.com/cmderdev/cmder/releases)
- Import settings from ./cmder/ConEmu.xml (in repo)

## Windows Terminal

- Install Windows Terminal
- Put profile.json in:
  %USERPROFILE%/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/
```shell
$ # e.g.
$ cmd /C "mklink /H %USERPROFILE%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\profiles.json %USERPROFILE%\dotfiles\windows_terminal\profiles.json"
```

# Install (Any Platform)

* Execute install.sh

# Troubleshooting
## which lua dll?
:lua print("x")
:echo has("lua")
