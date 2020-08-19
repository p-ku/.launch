#!/bin/bash
apt -y full-upgrade

# Copied from https://missing.csail.mit.edu/2020/editors/
# "Many programs use the GNU Readline library for their command-line interface."
# "Readline supports (basic) Vim emulation too, which can be enabled by adding the following line to the ~/.inputrc file:"
echo "set editing-mode vi" >> /home/$SUDO_USER/.inputrc

# Add some basic Vim plugins, recommended by the MIT missing semester class
mkdir -p /home/$SUDO_USER/.vim/pack/vendor/start

cd /home/$SUDO_USER/.vim/pack/vendor/start

git clone https://github.com/ctrlpvim/ctrlp.vim
git clone https://github.com/mileszs/ack.vim
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/easymotion/vim-easymotion
# With this setting, for example, the Python REPL will support Vim bindings.

cd /home/$SUDO_USER

git clone --recursive https://github.com/sorin-ionescu/prezto.git

DOTNAME=$(ls /home/$SUDO_USER/dotfile/dots)
for dotfile in $DOTNAME; do
  ln -sf /home/$SUDO_USER/dotfiles/dots/$dotfile /home/$SUDO_USER/."$dotfile"
done

apt -y install vim tmux zsh
