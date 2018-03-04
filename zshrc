# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

if [[ $OSTYPE == "cygwin" ]]; then
  export PATH=/c/cygwin64/bin:$PATH
  export PATH=/c/Program\ Files\ \(x86\)/vim/vim80/:$PATH
  export PATH=/c/Program\ Files/Git/cmd/:$PATH
  export PATH=/c/Program\ Files/Git/bin/:$PATH

  alias gvimdiff='gvimdiff.bat'
  # alias mix='docker dev -- mix'

  gvim() {
    gvim.bat $(cygpath -w $@)
  }

  alias open="cygstart"
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

export BOSH_CLIENT=admin
export BOSH_CLIENT_SECRET=`bosh int ~/deployments/vbox/creds.yml --path /admin_password`
export BOSH_ENVIRONMENT=vbox

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='gvim.bat'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
export SSH_KEY_PATH="~/.ssh/id_rsa.ppk"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
