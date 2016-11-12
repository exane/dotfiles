## access with windows gvim vimrc from babun  
  gvim() {
    OLD_HOME=$HOME
    OLD_VIMRUNTIME=$VIMRUNTIME
    export HOME=/cygdrive/c/Users/exane/
    export VIMRUNTIME="C:\Program Files (x86)\Vim\complete-x64"
    TARGET=$(cygpath -w $1)
    (/cygdrive/c/Program\ Files\ \(x86\)/Vim/complete-x64/gvim.exe $TARGET &)
    export HOME=$OLD_HOME
    export VIMRUNTIME=$OLD_VIMRUNTIME
  }
