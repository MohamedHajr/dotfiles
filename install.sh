#!/bin/bash

git clone https://github.com/MohamedHajr/dotfiles.git
cd dotfiles

./symlink.sh
./aptinstall.sh

# Get all upgrades
sudo apt upgrade -y

# See our bash changes
source ~/.bash_profile

# Fun hello
figlet "... and we're back!" | lolcat
