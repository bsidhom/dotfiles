# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH in order of increasing precedence
# NOTE: all new path elements take higher precedence than sytem PATH
if [ -d "$HOME/.local" ] ; then
    PATH="$HOME/.local/bin:$HOME/.local/sbin:$PATH"
fi
if [ -d "$HOME/opt" ] ; then
    PATH="$HOME/opt/bin:$HOME/opt/sbin:$PATH"
fi
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export PATH
export USE_CCACHE=1
