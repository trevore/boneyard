# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Forward X and use ssh Agent
alias ssh='ssh -X - A'

# Set editor to vim
export EDITOR=vim

# keeps duplicate entries out of history (also ls, fg, bg, ssh)
export HISTIGNORE="&:ls:ll"
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=5000

# Display the current load on login
uptime
