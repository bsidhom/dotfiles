# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# oh-my-zsh configuration

ZSH_THEME="cypher"
DISABLE_AUTO_UPDATE="true"
#DISABLE_CORRECTION="true"
#COMPLETION_WAITING_DOTS="true"

plugins=(cabal gitfast gnu-utils go golang lein node npm pep8 python rsync sbt scala zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# user configuration

if [ -f ~/.bash_aliases ] ; then
    source ~/.bash_aliases
fi
if [ -f ~/.zsh_aliases ] ; then
    source ~/.zsh_aliases
fi

# set TERM based on termdetect result
if [ $(hash termdetect 2>/dev/null && hash perl 2>/dev/null && echo 0) ] ; then
    export TERM="$(termdetect -t)"
fi

# enable dircolors support
if [ $(hash dircolors 2>/dev/null && echo 0) ] ; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [ "x$REMOTE_SESSION_TYPE" != "x1" ] ; then
    # only use ANSI solarized Vim theme if we're in a local session
    # (or if this environment variable has been pushed by the remote user)
    export TERMINAL_SOLARIZED=1
fi

setopt no_inc_append_history
unsetopt auto_cd
unsetopt cdable_vars
bindkey -v
