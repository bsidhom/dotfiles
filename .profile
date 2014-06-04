# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -d "$HOME/go" ] ; then
    export GOPATH="$HOME/go"
fi

# set PATH in order of increasing precedence
# NOTE: all new path elements take higher precedence than sytem PATH
if [ ! -z "$GOPATH" ] ; then
    PATH="$GOPATH/bin:$PATH"
fi
if [ -d "$HOME/.local" ] ; then
    PATH="$HOME/.local/bin:$HOME/.local/sbin:$PATH"
fi
if [ -d "$HOME/opt" ] ; then
    PATH="$HOME/opt/bin:$HOME/opt/sbin:$PATH"
fi
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# miscellaneous environment variables

# check if we're in an SSH session
# (see http://unix.stackexchange.com/a/9607)
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export REMOTE_SESSION_TYPE=1
fi

export EDITOR=vim
export PATH
export USE_CCACHE=1
