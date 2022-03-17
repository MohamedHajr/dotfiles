#!/bin/bash

echo $(pwd)

./symlink.sh
./aptinstall.sh

# Get all upgrades
sudo apt upgrade -y

# See our bash changes
source ~/.bash_profile

# Fun hello
figlet "... and we're back!" | lolcat
