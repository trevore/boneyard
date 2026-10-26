# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/go/bin

export PATH

GOPATH=$HOME/go

export GOPATH

#eval `keychain --eval`
uptime
