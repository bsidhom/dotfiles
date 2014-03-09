#!/usr/bin/env bash
# Link all regular files in the DOTFILES directory to the directory this script
# is called from

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
find "$DOTFILES_DIR" \
    -maxdepth 1 \
    -not \( -path "${DOTFILES_DIR}/.git" -prune \) \
    -name '.*' \
    -exec ln -s {} . \;
