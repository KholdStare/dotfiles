#!/bin/bash
# creates links in the parent directory to all dotfiles in this directory.

set -e
set -u

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd ${SCRIPT_DIR} > /dev/null

COMMAND=""
if [[ $# -gt 0 ]]; then
    COMMAND=$1
fi

OS=$(uname)

function get_link_path() {
    FILENAME=$1
    pushd $(dirname ${FILENAME}) > /dev/null
    if [[ "${OS}" = "Darwin" ]]; then
        readlink $(basename ${FILENAME})
    else
        stat -c '%N' $(basename ${FILENAME}) | cut -d ' ' -f 3 | sed -e 's/^`//' -e "s/'$//"
    fi
    popd > /dev/null
}

function get_target_for_file() {
    echo ${SCRIPT_DIR}/$1
}

function create_link() {
    FILENAME=$1
    TARGET=$(get_target_for_file ${FILENAME})
    LINKNAME=${HOME}/${FILENAME}

    echo LINKING ${FILENAME}
    mkdir -p ${HOME}/$(dirname ${FILENAME})
    ln -s ${TARGET} ${LINKNAME}
}

function backup_file() {
    FILENAME=$1
    TIMESTAMP=$(date +'%Y.%m.%d')
    BACKUP_NAME=${FILENAME}.${TIMESTAMP}.bak
    echo BACK UP ${FILENAME} to ${BACKUP_NAME}
    cp -r ${FILENAME} ${BACKUP_NAME}
}

# Bootstrap spacemacs
if [[ ! -e "${HOME}/.emacs.d/spacemacs.mk" ]]; then
    echo "BOOTSTRAPPING spacemacs"
    git clone https://github.com/syl20bnr/spacemacs ${HOME}/.emacs.d
fi

LINKED_FILES=".bashrc .bash_profile .bash_completion .gitconfig .git_template 
    .tmux.conf .vimrc .gvimrc .ghci .spacemacs bin/* .stack/*"
COPIED_FILES=".cabal/config"

chmod u+x ${SCRIPT_DIR}/bin/*

for file in $LINKED_FILES; do

    TARGET=${SCRIPT_DIR}/$file
    LINKNAME=${HOME}/$file
    CREATE_LINK=0

    if [[ -e ${LINKNAME} ]]; then
        if [[ -L ${LINKNAME} ]]; then
            CURRENT_TARGET=$(get_link_path ${LINKNAME})
            if [[ "$CURRENT_TARGET" == "$TARGET" ]]; then
                echo LINKED $file exists
                continue
            else
                echo LINK $file already exists but points to ${CURRENT_TARGET}
            fi
        else 
            echo FILE $file already exists
        fi

        if [[ "${COMMAND}" == "force" ]]; then
            backup_file ${LINKNAME}
            rm ${LINKNAME}
            CREATE_LINK=1
        fi
    else
        CREATE_LINK=1
    fi

    if [[ ${CREATE_LINK} -eq 1 ]]; then
        create_link $file
    fi
done

for file in ${COPIED_FILES}; do
    if [[ ! -e ${HOME}/$file ]]; then
        echo COPYING $file
        mkdir -p ${HOME}/$(dirname ${file})
        cp ${SCRIPT_DIR}/$file ${HOME}/$file;
    else
        echo COPY $file already exists
    fi
done

# Bootstrap vim
if [[ ! -e "${HOME}/.vim/autoload/plug.vim" ]]; then
    echo "BOOTSTRAPPING vim"
    curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    mkdir -p ${HOME}/.config
    ln -s ../.vim ${HOME}/.config/nvim
    ln -s ../.vimrc ${HOME}/.config/nvim/init.vim
fi

# Fix cabal config paths
CABAL_CONFIG_FILE="${HOME}/.cabal/config"
if [[ -e "${CABAL_CONFIG_FILE}" ]]; then
    echo "FIXING cabal config paths"
    backup_file ${CABAL_CONFIG_FILE}
    sed -i"" -e "s!\~!${HOME}!" ${CABAL_CONFIG_FILE}
fi

# Fix warning from ghci complaining it is writable
chmod g-w ${SCRIPT_DIR}/.ghci

popd > /dev/null
