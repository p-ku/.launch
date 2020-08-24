#!/bin/bash
apt -y update; apt -y upgrade

# Copied from https://missing.csail.mit.edu/2020/editors/
# "Many programs use the GNU Readline library for their command-line interface."
# "Readline supports (basic) Vim emulation too, which can be enabled by adding the following line to the ~/.inputrc file:"
echo "set editing-mode vi" >> /home/"$SUDO_USER"/.inputrc

# Add some basic Vim plugins, recommended by the MIT missing semester class
mkdir -p /home/"$SUDO_USER"/.vim/pack/vendor/start

cd /home/"$SUDO_USER"/.vim/pack/vendor/start || exit

dotname=$(ls /home/"$SUDO_USER"/.launch/dots)
for dotfile in $dotname; do
  ln -s /home/"$SUDO_USER"/.launch/dots/"$dotfile" /home/"$SUDO_USER"/."$dotfile"
done 

git clone https://github.com/ctrlpvim/ctrlp.vim.git
vim -u NONE -c "helptags ctrlp.vim/doc" -c q
git clone https://github.com/mileszs/ack.vim.git
vim -u NONE -c "helptags ack.vim/doc" -c q
git clone https://github.com/scrooloose/nerdtree.git
vim -u NONE -c "helptags fugitive/doc" -c q
git clone https://github.com/easymotion/vim-easymotion.git
vim -u NONE -c "helptags vim-easymotion/doc" -c q
git clone https://github.com/tpope/vim-fugitive.git 
vim -u NONE -c "helptags fugitive/doc" -c q

cd /home/"$SUDO_USER" || exit

git clone --recursive https://github.com/sorin-ionescu/prezto.git ./.zprezto

apt -y install vim tmux zsh ack-grep
