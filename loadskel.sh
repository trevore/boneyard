#! /bin/bash

# Make sure the home dir permissions are restrictive
chmod 700 ~

# make .backup to preserve existing skel files
if [ ! -d ~/.backup ]; then
    mkdir ~/.backup
fi
chmod 700 ~/.backup

if [ ! -d ~/.backup/.ssh ]; then
    mkdir ~/.backup/.ssh
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

TIME=$(/bin/date +%s)

# Backup files to ~/.backup before you clobber them
safe_copy() {
  if [ -f ~/$@ ]; then 
    cp -p ~/$@ ~/.backup/$@-$TIME
  fi
  cp -v ~/git/boneyard/skel/$@ ~/$@
  chmod 644 ~/$@
}

# Files to copy from skel
safe_copy ".bash_logout"
safe_copy ".bash_profile"
safe_copy ".bashrc"
safe_copy ".forward"
safe_copy ".gitconfig"
safe_copy ".vimrc"
safe_copy ".ssh/authorized_keys"
