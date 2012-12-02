# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# This crap is for the U of A
if [ -f /home/skel/bash/bashrc ]; then
  source /home/skel/bash/bashrc
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Setup prompt
PS1='\[\e[1;32m\](\[\e[0;37m\]\!\[\e[1;32m\])\[\e[1;37m\]\u@\[\e[0;34m\]\h\[\e[0;37m\]:\w\[\e[1;32m\]\$ \[\e[0m\]'

# Different prompt for root make text red
if [ "$(id -u)" = "0" ]; then
  PS1='\[\e[1;32m\](\[\e[0;37m\]\!\[\e[1;32m\])\[\e[0;31m\]\u\[\e[1;37m\]@\[\e[0;34m\]\h\[\e[0;37m\]:\w\[\e[1;32m\]\$ \[\e[0m\]'
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
  PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
  ;;
*)
  ;;
  esac         

# GPG is PGP
alias pgp='gpg' 

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

# And in fact, if vim is there alias vi to it
if [ -f /usr/bin/vim ]; then
  alias vi='vim'
fi

# keeps duplicate entries out of history (also simple common commands)
export HISTIGNORE="&:ls:ll:fg:bg:pwd:cd"
export HISTCONTROL=ignoredups:ignorespace

# Keep 1000 lines of history in memory and 5000 in the history file
export HISTSIZE=1000
export HISTFILESIZE=5000

# Append to the history file, don't overwrite it:
shopt -s histappend

## Check the window size after each command and, if necessary,
## update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Get rid of annoying command not found delay
unset command_not_found_handle

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# lesspipe is lesspipe.sh on some distros
[ -x /usr/bin/lesspipe.sh ] && eval "$(SHELL=/bin/sh lesspipe.sh)"
