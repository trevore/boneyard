# .bashrc

# This crap is for the U of A
if [ -f /home/skel/bash/bashrc ]; then
source /home/skel/bash/bashrc
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Setup prompt
PS1='\[\e[1;32m\](\[\e[0;37m\]\!\[\e[1;32m\])\[\e[1;37m\]\u@\[\e[1;34m\]\h\[\e[0;37m\]:\w\[\e[1;32m\]\$ \[\e[0m\]'

# Different prompt for root make text red
if [ "$(id -u)" = "0" ]; then
  PS1='\[\e[1;32m\](\[\e[0;37m\]\!\[\e[1;32m\])\[\e[0;31m\]\u\[\e[1;37m\]@\[\e[1;34m\]\h\[\e[0;37m\]:\w\[\e[1;32m\]\$ \[\e[0m\]'
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
    esac         

# Forward X and use ssh Agent
alias ssh='ssh -X -A'

# command to update rc files
alias boneup='(cd ~/git/boneyard ; git pull ; ~/git/boneyard/loadskel.sh)'            
# Get some color in ls
alias ls='ls --color=auto'

# Give root same enviroment unless - is passed
alias su='su -m'

# Set editor to vim
export EDITOR=vim

# keeps duplicate entries out of history (also ls, fg, bg, ssh)
export HISTIGNORE="&:ls:ll"
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=5000

# Get rid of annoying command not found delay
unset command_not_found_handle
