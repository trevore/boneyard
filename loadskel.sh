#! /bin/bash

# Make sure the home dir permissions are restrictive
chmod 700 ~

# Why don't I have a function to create directories?

# Binz!
if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi
chmod 700 ~/bin

# make .config
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi
chmod 700 ~/.config

# htop in .config
if [ ! -d ~/.config/htop ]; then
    mkdir ~/.config/htop
fi
chmod 700 ~/.config/htop

# make .backup to preserve existing skel files
if [ ! -d ~/.backup ]; then
    mkdir ~/.backup
fi
chmod 700 ~/.backup

if [ ! -d ~/.backup/.ssh ]; then
    mkdir ~/.backup/.ssh
fi

if [ ! -d ~/.backup/.gnupg ]; then
    mkdir ~/.backup/.gnupg
fi

if [ ! -d ~/.backup/.config ]; then
    mkdir ~/.backup/.config
fi

if [ ! -d ~/.backup/.config/htop ]; then
    mkdir ~/.backup/.config/htop
fi

# make .vim .vim/backup and .vim/tmp if they don't exist
if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi
chmod 700 ~/.vim

if [ ! -d ~/.vim/backup ]; then
    mkdir ~/.vim/backup
fi

if [ ! -d ~/.vim/tmp ]; then
    mkdir ~/.vim/tmp
fi

if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
fi
chmod 700 ~/.ssh

if [ ! -d ~/.gnupg ]; then
    mkdir ~/.gnupg
fi
chmod 700 ~/.gnupg

TIME=$(/bin/date +%s)

# Backup files to ~/.backup before you clobber them
safe_copy() {
  if [ -f ~/$@ ]; then 
    cp -p ~/$@ ~/.backup/$@-$TIME
  fi
  cp -v ~/git/boneyard/skel/$@ ~/$@
  chmod 600 ~/$@
}

# Same as safe_copy for scripts
script_copy() {
  if [ -f ~/bin/$@ ]; then 
    cp -p ~/bin/$@ ~/.backup/$@-$TIME
  fi
  cp -v ~/git/boneyard/scripts/$@ ~/bin/$@
  chmod 700 ~/bin/$@
}


# Files to copy from skel
safe_copy ".bash_logout"
safe_copy ".bash_profile"
safe_copy ".bashrc"
safe_copy ".forward"
safe_copy ".gitconfig"
safe_copy ".vimrc"
safe_copy ".screenrc"
safe_copy ".pinerc"
safe_copy ".ssh/authorized_keys"
safe_copy ".gnupg/gpg.conf"
safe_copy ".config/htop/htoprc"
script_copy "keysign"

# Reload the .bashrc
source ~/.bashrc
