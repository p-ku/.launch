#!/bin/bash
apt -y full-upgrade

cd /home/$SUDO_USER/.vim/pack/vendor/start

find . -maxdepth 1 -type d -exec sh -c '(cd {} && git pull)' ';'

cd /home/$SUDO_USER/.zprezto

git pull
git submodule update --init --recursive

cd /home/$SUDO_USER
