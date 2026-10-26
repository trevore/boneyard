#! /bin/bash

if [ $# -ne 1 ]
then
  echo "Usage $0 <Hostname>"
  exit
fi

ssh -A $1 git --git-dir=git/boneyard/.git stash
ssh -A $1 git --git-dir=git/boneyard/.git pull 
ssh $1 ~/git/boneyard/loadskel.sh
