#!/bin/bash
# creates links in the parent directory to all dotfiles in this directory.
# HAS to be run in this directory

# e.g.Turns ".cabal/config" into "../"
function to_breadcrumbs() {
    echo "$1" | sed -r -e 's@[^/]@@g' -e 's@/@../@g'
}

LINKED_FILES=".bash_profile .gitconfig .git_template .tmux.conf .vimrc .ghci .cabal/config bin/*"
COPIED_FILES=""

chmod u+x bin/*

for file in $LINKED_FILES; do
    mkdir -p ../$(dirname $file)
    ln -s $(to_breadcrumbs $file)dotfiles/$file ../$file;
done

for file in $COPIED_FILES; do
    cp $file ../$file;
done

# Fix warning from ghci complaining it is writable
chmod g-w .ghci
