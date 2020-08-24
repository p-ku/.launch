# .launch

Various configs, scripts, dotfiles, and whatnot, etc.

## How I prepare a new workstation:
Install git:
```bash
sudo apt -y install git
```
Clone this repository:
```bash
cd ~
git clone --recursive https://github.com/p-ku/dotfiles.git
```
Run the initiation script:
```bash
sudo bash .launch/init.sh
```
Change default shell to zsh:
```bash
chsh -s $(which zsh)
```
Log out for changes to take effect.
All together now:
```bash
sudo apt install -y git; \
cd ~; \
git clone --recursive https://github.com/p-ku/dotfiles.git; \
sudo bash .launch/init.sh; \
chsh -s $(which zsh)
```
## How I update:
Run the update script:
```bash
sudo bash ~/.launch/update.sh
```
