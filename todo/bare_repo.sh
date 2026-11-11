# not intended to be run, just a reference

git init --bare $HOME/.cfg
alias dots='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
dots config --local status.showUntrackedFiles no
