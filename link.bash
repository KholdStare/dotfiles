#!/bin/bash
# creates links in the parent directory to all dotfiles in this directory.
# HAS to be run in this directory

LINKED_FILES=".gitconfig .git_template .tmux.conf .vimrc .ghci"
COPIED_FILES=".cabal/config"

for file in $LINKED_FILES; do ln -s dotfiles/$file ../$file; done

for file in $COPIED_FILES; do cp $file ../$file; done

# Fix warning from ghci complaining it is writable
chmod g-w .ghci
