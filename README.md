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
git clone https://github.com/p-ku/.launch.git
```
Run the initiation script:
```bash
sudo bash .launch/init.sh
```
Change default shell to zsh:
```bash
chsh -s $(which zsh)
```
A password is necessary here. Log out for changes to take effect.
All together now:
```bash
sudo apt install -y git; \
cd ~; \
git clone https://github.com/p-ku/.launch.git; \
sudo bash .launch/init.sh; \
chsh -s $(which zsh)
```
## How I update:
Run the update script:
```bash
sudo bash ~/.launch/update.sh
```
