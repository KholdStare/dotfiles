#!/bin/bash
# creates links in the parent directory to all dotfiles in this directory.
# HAS to be run in this directory

set -e
set -u

# e.g.Turns ".cabal/config" into "../"
function to_breadcrumbs() {
    echo "$1" | sed -r -e 's@[^/]@@g' -e 's@/@../@g'
}

LINKED_FILES=".bash_profile .gitconfig .git_template .tmux.conf .vimrc .gvimrc .ghci .cabal/config bin/*"
COPIED_FILES=""

chmod u+x bin/*

for file in $LINKED_FILES; do
    if [[ ! -e ../$file ]]; then
        echo LINKING $file
        mkdir -p ../$(dirname $file)
        ln -s $(to_breadcrumbs $file)dotfiles/$file ../$file
    else
        echo LINK $file already exists
    fi
done

for file in $COPIED_FILES; do
    if [[ ! -e ../$file ]]; then
        echo COPYING $file
        cp $file ../$file;
    else
        echo COPY $file already exists
    fi
done

# Bootstrap vim
if [[ ! -e "${HOME}/.vim/bundle/neobundle.vim" ]]; then
    echo "BOOTSTRAPPING vim"
    mkdir -p ~/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim
fi

# Fix warning from ghci complaining it is writable
chmod g-w .ghci
