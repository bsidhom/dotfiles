#!/usr/bin/env bash
# replace_dotfiles.sh
# link submodules of DOTFILES_DIR into the current user's home directory,
# skipping any directories that already exist

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$DOTFILES_DIR" >/dev/null
git submodule foreach --quiet '
    if [ -a "$HOME/$path" ] ; then
        echo "$path already exists"
    else
        ln -s "$DOTFILES_DIR/$path" "$HOME"
    fi'
popd >/dev/null
