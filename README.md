# dotfiles

Various configs, scripts, dotfiles, and whatnot, etc.

## How I use it
Clone this repository:
```bash
cd ~
git clone --recursive https://github.com/p-ku/dotfiles.git
```
Run the initiation script:
```bash
sudo bash dotfiles/init.sh
```
Change default shell to zsh:
```bash
chsh -s $(which zsh)
```
Log out for changes to take effect.
All together now:
```bash
cd ~; \
git clone --recursive https://github.com/p-ku/dotfiles.git; \
sudo bash dotfiles/init.sh; \
chsh -s $(which zsh)
```
