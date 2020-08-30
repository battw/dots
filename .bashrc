# cat ~/.cache/wal/sequences # Load the wal colorscheme

# some colour
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
alias dir='dir --color=auto'




export GOPATH=~/go

# enable touch scrolling in firefox
export MOZ_USE_XINPUT2=1

# colours for the prompt
RESET="\[$(tput sgr0)\]"

RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
PURPLE="\[$(tput setaf 5)\]"
AQUA="\[$(tput setaf 6)\]"


PS1="${YELLOW}-->${RESET} "


if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi



alias al='cd ~/dropbox/go/src/github.com/llo-oll/algebra; pwd'

xdg-settings set default-web-browser firefox.desktop




export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


if [[ -z $IS_PATHS_SET ]]
then
    export IS_PATHS_SET=1
    export PATH=$PATH:~/dropbox/bin
    export PATH=$PATH:~/bin
    export PATH=$PATH:$HOME/.emacs.d/bin
    export PATH=$PATH:$GOPATH/bin
fi
