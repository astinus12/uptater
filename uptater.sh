#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)
clear
echo ${bold}"Updating this Macbook's Development Environment:"${normal}
echo
echo
echo ${bold}"Starting with Homebrew..."${normal}
brew update;brew upgrade & wait
echo
echo ${bold}"Updating oh-my-zsh..."${normal}
sh $ZSH/tools/upgrade.sh
echo
echo ${bold}"Updating git repos..."${normal}
cd /Users/wnovak/Documents/git
for REPO in `ls`; do (cd "$REPO"; echo "updating" "$REPO" git pull); done;
cd /Users/wnovak/Documents/Scripts/git/uptater; git pull & wait
echo
echo ${bold}"Updating svn repos..."${normal}
cd /Users/wnovak/Documents/puppet; svn up & wait
echo
echo ${bold}"Updating System..."${normal}
softwareupdate -i -a & wait
wait
echo
echo ${bold}Complete${normal}
