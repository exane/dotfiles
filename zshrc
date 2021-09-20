#!/bin/zsh
export ZSH=$HOME/.oh-my-zsh

if [[ $(uname) == "Linux" ]]; then
fi

if [[ $OSTYPE == "cygwin" ]]; then
  export PATH="/cygdrive/c/Program Files (x86)/vim/vim80:$PATH"
  export PATH="/usr/bin:$PATH"
  export PATH="/cygdrive/y/Program Files/Oracle/VirtualBox:$PATH"

  alias gvimdiff="gvimdiff.bat"
  alias mix="mix.bat"
  alias open="cygstart"

  gvim() {
    local PATH="/cygdrive/c/Program Files/Git/bin:$PATH"
    local PATH="/cygdrive/c/Program Files/Git/cmd:$PATH"

    if [[ -z $@ ]]; then
      PATH=$PATH gvim.bat
    else
      PATH=$PATH gvim.bat $(cygpath -w $@)
    fi
  }

  hyperv-enable () {
    echo "Enabling Hyper-V..."
    bcdedit /set hypervisorlaunchtype auto
    echo "Restart needed to complete."
  }

  hyperv-disable () {
    echo "Disabling Hyper-V..."
    bcdedit /set hypervisorlaunchtype off
    echo "Restart needed to complete."
  }

  # Cmder new tab in same working directory
  # https://conemu.github.io/en/ShellWorkDir.html
  # set_conemu_cwd() { ConEmuC -StoreCWD }
  # precmd_functions+=set_conemu_cwd

  # load docker env (should be in global env vars)
  # : $(docker-machine env --shell dev 2> /dev/null)
  # eval $("/cygdrive/c/Program Files/Docker Toolbox/docker-machine.exe" env --shell dev 2> /dev/null)
  # alias docker-start=". ~/dev-env/bin/docker-start.sh"  # this alias will start docker-machine
fi

if [[ $(uname) = "Darwin" ]]; then
  if [[ -d ~/deployments ]]; then
    export BOSH_CLIENT=admin
    export BOSH_CLIENT_SECRET=`bosh int ~/deployments/vbox/creds.yml --path /admin_password`
    export BOSH_ENVIRONMENT=vbox
    export BOSH_LITE_PATH="~/deployments/vbox/"
  fi

  export ANDROID_HOME=~/Library/Android/sdk
  export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"
  export PATH="/usr/local/bin:$PATH"

  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  alias be="bundle exec"
  alias cf="$HOME/dotfiles/cf_wrapper.sh cf $*"
  export PATH="/usr/local/opt/curl/bin:$PATH"
  export LC_ALL=en_US.UTF-8

  # added by travis gem
  [ -f /Users/Tim/.travis/travis.sh ] && source /Users/Tim/.travis/travis.sh
fi

alias docker="$HOME/dev-env/bin/docker-dev.sh docker $*"
alias dps='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Ports}}"'
alias grep='grep --color=always'

export ERL_AFLAGS="-kernel shell_history enabled"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

if [[ $WSL_DISTRO_NAME ]]; then
  PS1="[WSL]$PS1"
fi

if [[ -d $HOME/.asdf ]]; then
  . $HOME/.asdf/asdf.sh
fi
