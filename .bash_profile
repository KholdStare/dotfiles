if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

# ========================================
# Paths
# ========================================
export PATH=$HOME/tools/bin:$PATH
export LD_LIBRARY_PATH=${HOME}/tools/lib:${LD_LIBRARY_PATH}
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/bin:$PATH

# ========================================
# Customization
# ========================================
# source a custom local bash configuration if one exists
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
