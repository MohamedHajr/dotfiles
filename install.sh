#!/bin/bash

echo $(pwd)

./symlink.sh
./aptinstall.sh

# Get all upgrades
sudo apt upgrade -y

#Git Global Configuration
git config --global core.editor /usr/bin/vim

##Git Aliases
git config --global alias.tree "log --oneline --decorate --all --graph"

##Github account info
git config --global user.name "Mo Hajr"
git config --global user.email "mo@hajr.io"

##installing git submodules
git submodule init
git submodule update
git pull --recurse-submodules

# See our bash changes
source ~/.bash_profile

# Fun hello
figlet "... and we're back!" | lolcat
