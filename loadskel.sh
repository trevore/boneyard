#! /bin/bash

# Make sure the home dir permissions are restrictive
chmod 700 ~

# Function to create directories if they do not exist
# $1 is the location of the directory under ~/
safe_mkdir() {
    if [ ! -d ~/$1 ]; then
        mkdir ~/$1
    fi
    chmod 700 ~/$1
}

safe_mkdir "bin"
safe_mkdir ".config"
safe_mkdir ".config/htop"
safe_mkdir ".vim"
safe_mkdir ".vim/backup"
safe_mkdir ".vim/tmp"
safe_mkdir ".vim/autoload"
safe_mkdir ".vim/bundle"
safe_mkdir ".ssh"
safe_mkdir ".gnupg"

# Make the backup directory for running the safe copies
safe_mkdir ".backup"
safe_mkdir ".backup/.ssh"
safe_mkdir ".backup/.gnupg"
safe_mkdir ".backup/.config"
safe_mkdir ".backup/.config/htop"

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
safe_copy ".hgrc"
safe_copy ".vimrc"
safe_copy ".screenrc"
safe_copy ".pinerc"
safe_copy ".ssh/authorized_keys"
safe_copy ".gnupg/gpg.conf"
safe_copy ".config/htop/htoprc"
safe_copy ".vim/autoload/pathogen.vim"
script_copy "keysign"

# Reload the .bashrc
source ~/.bashrc

# Add powerline to vim
git --exec-path=~/.vim/bundle clone git://github.com/Lokaltog/vim-powerline.git

