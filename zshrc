#!/bin/bash
export ZSH=$HOME/.oh-my-zsh

if [[ $OSTYPE == "cygwin" ]]; then
  export PATH="/cygdrive/c/Program Files (x86)/vim/vim80:$PATH"
  export PATH="/cygdrive/c/cygwin64/bin:$PATH"

  alias gvimdiff='gvimdiff.bat'
  alias mix=mix.bat

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

  alias open="cygstart"
fi

if [[ $(uname) = "Darwin" ]]; then
  if [[ -d ~/deployments ]]; then
    export BOSH_CLIENT=admin
    export BOSH_CLIENT_SECRET=`bosh int ~/deployments/vbox/creds.yml --path /admin_password`
    export BOSH_ENVIRONMENT=vbox
    export BOSH_LITE_PATH="~/deployments/vbox/"
  fi

  export ANDROID_HOME=~/Library/Android/sdk
  export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
fi

alias docker="~/dev-env/bin/docker-dev.sh docker $*"

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
