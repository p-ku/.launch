#!/bin/bash
apt -y update; apt -y upgrade

cd /home/"$SUDO_USER"/.vim/pack/vendor/start || exit

REPNAME=$(ls /home/"$SUDO_USER"/.vim/pack/vendor/start)
for repos in $REPNAME; do
  cd /home/"$SUDO_USER"/.vim/pack/vendor/start/"$repos" || exit
  git pull
done

cd /home/"$SUDO_USER"/.zprezto || exit

git pull
git submodule update --init --recursive

DOTNAME=$(ls /home/"$SUDO_USER"/.launch/dots)
for dotfile in $DOTNAME; do
  ln -sfn /home/"$SUDO_USER"/.launch/dots/"$dotfile" /home/"$SUDO_USER"/."$dotfile"
done

cd /home/"$SUDO_USER" || exit
