#!/bin/sh

# git init --bare $HOME/.cfg
alias dots='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
dots config --local status.showUntrackedFiles no
echo "alias dots='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
