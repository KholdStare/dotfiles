#!/bin/bash
# creates links in the parent directory to all dotfiles in this directory.
# HAS to be run in this directory

FILES=".gitconfig .git_template .tmux.conf .vimrc .ghci"

for file in $FILES; do ln -s dotfiles/$file ../$file; done

# Fix warning from ghci complaining it is writable
chmod g-w .ghci
