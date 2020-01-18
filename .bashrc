# cat ~/.cache/wal/sequences # Load the wal colorscheme

# some colour
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
alias dir='dir --color=auto'

export PATH=$PATH:~/dropbox/bin
export PATH=$PATH:~/bin

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

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
















