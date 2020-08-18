#!/bin/bash
apt full-upgrade
apt install git vim tmux

# Copied from https://missing.csail.mit.edu/2020/editors/
# "Many programs use the GNU Readline library for their command-line interface."
# "Readline supports (basic) Vim emulation too, which can be enabled by adding the following line to the ~/.inputrc file:"
echo "set editing-mode vi" >> ~/.inputrc

# Add some basic Vim plugins, recommended by the MIT missing semester class
mkdir -p ~/.vim/pack/vendor/start
cd ~/.vim/pack/vendor/start
git clone https://github.com/ctrlpvim/ctrlp.vim
git clone https://github.com/mileszs/ack.vim
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/easymotion/vim-easymotion

# With this setting, for example, the Python REPL will support Vim bindings.
