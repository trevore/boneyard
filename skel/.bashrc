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
PS1="\[\e[32;1m\](\[\e[37;1m\]\!\[\e[32;1m\]) \[\e[32;1m\][\[\e[37;1m\]\u@\h \w\[\e[32;1m\]]$ \[\e[0m\]"
# Fancy prompt
#PS1="\[\e[32;1m\](\[\e[37;1m\]\u@\h\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])\n(\[\e[37;1m\]! \!\[\e[32;1m\])-> \[\e[0m\]"

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

# Set editor to vim
export EDITOR=vim

# keeps duplicate entries out of history (also ls, fg, bg, ssh)
export HISTIGNORE="&:ls:ll"
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=5000

# Get rid of annoying command not found delay
unset command_not_found_handle
