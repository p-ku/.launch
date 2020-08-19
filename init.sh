#!/bin/bash

real_user=$SUDO_USER

apt -y full-upgrade

# Copied from https://missing.csail.mit.edu/2020/editors/
# "Many programs use the GNU Readline library for their command-line interface."
# "Readline supports (basic) Vim emulation too, which can be enabled by adding the following line to the ~/.inputrc file:"
echo "set editing-mode vi" >> /home/$real_user/.inputrc

# Add some basic Vim plugins, recommended by the MIT missing semester class
mkdir -p /home/$real_user/.vim/pack/vendor/start

cd /home/$real_user/.vim/pack/vendor/start

sudo -u $real_user git clone https://github.com/ctrlpvim/ctrlp.vim
sudo -u $real_user git clone https://github.com/mileszs/ack.vim
sudo -u $real_user git clone https://github.com/scrooloose/nerdtree
sudo -u $real_user git clone https://github.com/easymotion/vim-easymotion
# With this setting, for example, the Python REPL will support Vim bindings.

cd /home/$real_user/

sudo -u $real_user git clone --recursive https://github.com/sorin-ionescu/prezto.git

DOTPATH=/home/$real_user/dotfiles/dots/*
for dotfile in $DOTPATH; do
  ln -sf /home/$real_user/dotfiles/dots/$dotfile /home/$real_user/".$dotfile"
done

apt -y install vim tmux zsh
