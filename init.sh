#!/bin/bash

real_user=$SUDO_USER

apt -y full-upgrade
apt -y install git vim tmux zsh

# Copied from https://missing.csail.mit.edu/2020/editors/
# "Many programs use the GNU Readline library for their command-line interface."
# "Readline supports (basic) Vim emulation too, which can be enabled by adding the following line to the ~/.inputrc file:"
echo "set editing-mode vi" >> ~/.inputrc

# Add some basic Vim plugins, recommended by the MIT missing semester class
sudo -u $real_user mkdir -p ~/.vim/pack/vendor/start
sudo -u $real_user cd ~/.vim/pack/vendor/start
sudo -u $real_user git clone https://github.com/ctrlpvim/ctrlp.vim
sudo -u $real_user git clone https://github.com/mileszs/ack.vim
sudo -u $real_user git clone https://github.com/scrooloose/nerdtree
sudo -u $real_user git clone https://github.com/easymotion/vim-easymotion
# With this setting, for example, the Python REPL will support Vim bindings.

sudo -u $real_user zsh

sudo -u $real_user git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

sudo -u $real_user ln -s ~/dotfiles/vimrc ~/.vimrc
sudo -u $real_user ln -s ~/dotfiles/tmux.config ~/.tmux.config
sudo -u $real_user ln -s ~/dotfiles/zdot/zshenv ~/.zshenv
sudo -u $real_user ln -s ~/dotfiles/zdot/zprofile ~/.zprofile
sudo -u $real_user ln -s ~/dotfiles/zdot/zshrc ~/.zshrc
sudo -u $real_user ln -s ~/dotfiles/zdot/zlogin ~/.zlogin
sudo -u $real_user ln -s ~/dotfiles/zdot/zlogout ~/.zlogout
sudo -u $real_user ln -s ~/dotfiles/zdot/zpreztorc ~/.zpreztorc
