# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# oh-my-zsh configuration

ZSH_THEME="cypher"
DISABLE_AUTO_UPDATE="true"
#DISABLE_CORRECTION="true"
#COMPLETION_WAITING_DOTS="true"

plugins=(cabal gitfast gnu-utils go golang lein node npm pep8 python rsync sbt scala screen sudo unison vi-mode)

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

export EDITOR=vim
