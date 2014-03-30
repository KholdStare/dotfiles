case "$COLORTERM" in
    gnome-terminal)
        case "$TERM" in
            *-256color) ;;
            *)
                export TERM=xterm-256color
                ;;
        esac
        ;;
esac

case "$TERM" in
    *-256color)
        color_prompt=yes
        ;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export PATH=$HOME/tools/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/bin:$PATH


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# source a custom local bash configuration if one exists
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi
