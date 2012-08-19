#! /bin/bash

# make .backup to preserve existing skel files
if [ ! -d ~/.backup ]; then
    mkdir ~/.backup
fi

# make .vim .vim/backup and .vim/tmp if they don't exist
if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi

if [ ! -d ~/.vim/backup ]; then
    mkdir ~/.vim/backup
fi

if [ ! -d ~/.vim/tmp ]; then
    mkdir ~/.vim/tmp
fi

TIME=$(/bin/date +%s)

# Backup files to ~/.backup before you clobber them
safe_copy() {
  cp -p ~/$@ ~/.backup/$@-$TIME
  cp -v skel/$@ ~
}

safe_copy ".bash_logout"
safe_copy ".bash_profile"
safe_copy ".bashrc"
safe_copy ".forward"
safe_copy ".gitconfig"
safe_copy ".vimrc"
