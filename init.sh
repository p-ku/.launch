#!/bin/bash
apt -y update; apt -y upgrade

# Copied from https://missing.csail.mit.edu/2020/editors/
# "Many programs use the GNU Readline library for their command-line interface."
# "Readline supports (basic) Vim emulation too, which can be enabled by adding the following line to the ~/.inputrc file:"
echo "set editing-mode vi" >> /home/$SUDO_USER/.inputrc

# Add some basic Vim plugins, recommended by the MIT missing semester class
mkdir -p /home/$SUDO_USER/.vim/pack/vendor/start

cd /home/$SUDO_USER/.vim/pack/vendor/start

git clone https://github.com/ctrlpvim/ctrlp.vim.git
set runtimepath^=~/.vim/bundle/ctrlp.vim
:helptags ~/.vim/bundle/ctrlp.vim/doc

git clone https://github.com/mileszs/ack.vim.git
vim -u NONE -c "helptags ack.vim/doc" -c q
git clone https://github.com/scrooloose/nerdtree.git
vim -u NONE -c "helptags fugitive/doc" -c q
git clone https://github.com/easymotion/vim-easymotion.git
vim -u NONE -c "helptags vim-easymotion/doc" -c q
git clone https://tpope.io/vim/fugitive.git
vim -u NONE -c "helptags fugitive/doc" -c q
# With this setting, for example, the Python REPL will support Vim bindings.

cd /home/$SUDO_USER

git clone --recursive https://github.com/sorin-ionescu/prezto.git ./.zprezto

apt -y install vim tmux zsh ack-grep
