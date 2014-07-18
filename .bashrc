# modified version of Ubuntu default bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# NOTE: only works for systems with notify-send
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable dircolors support
if [ $(hash dircolors 2>/dev/null && echo 0) ] ; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# set TERM using termdetect (if available)
if [ $(hash termdetect 2>/dev/null && hash perl 2>/dev/null && echo 0) ] ; then
    export TERM="$(termdetect -t)"
fi

# aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# host-specific settings
if [ -f ~/.host_shrc ] ; then
    . ~/.host_shrc
fi

# bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# interactive-session evironment variables
export PS1='\[\033[00;32m\]\u\[\033[00;00m\]@\[\033[01;31m\]\h:\[\033[01;34m\]\w\[\033[00;00m\]$ ' 

if [ "x$REMOTE_SESSION_TYPE" != "x1" ] ; then
    # only use ANSI solarized Vim theme if we're in a local session
    # (or if this environment variable has been pushed by the remote user)
    export TERMINAL_SOLARIZED=1
fi

# general options
# vim-style keybindings
set -o vi
umask 0022
