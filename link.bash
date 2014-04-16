#!/bin/bash
# creates links in the parent directory to all dotfiles in this directory.
# HAS to be run in this directory

set -e
set -u

# e.g.Turns ".cabal/config" into "../"
function to_breadcrumbs() {
    echo "$1" | sed -r -e 's@[^/]@@g' -e 's@/@../@g'
}

function get_link_path() {
    FILENAME=$1
    pushd $(dirname ${FILENAME}) > /dev/null
    stat -c '%N' $(basename ${FILENAME}) | cut -d ' ' -f 3 | sed -e 's/^`//' -e "s/'$//"
    popd > /dev/null
}

LINKED_FILES=".bashrc .bash_profile .gitconfig .git_template .tmux.conf .vimrc .gvimrc .ghci .cabal/config bin/*"
COPIED_FILES=""

chmod u+x bin/*

for file in $LINKED_FILES; do

    TARGET=$(to_breadcrumbs $file)dotfiles/$file
    LINKNAME=../$file

    if [[ ! -e ${LINKNAME} ]]; then
        echo LINKING $file
        mkdir -p ../$(dirname $file)
        ln -s ${TARGET} ${LINKNAME}
    elif [[ -L ${LINKNAME} ]]; then
        CURRENT_TARGET=$(get_link_path ${LINKNAME})
        if [[ "$CURRENT_TARGET" == "$TARGET" ]]; then
            echo LINKED $file exists
        else
            echo LINK $file already exists but points to ${CURRENT_TARGET}
        fi
    else 
        echo FILE $file already exists. Will not create link
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
    git clone git://github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim
fi

# Fix warning from ghci complaining it is writable
chmod g-w .ghci
