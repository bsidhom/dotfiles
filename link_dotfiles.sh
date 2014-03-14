#!/usr/bin/env bash
# link_dotfiles.sh
# Link all configuration files in the DOTFILES directory to the current user's
# home directory

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$HOME" >/dev/null
while read -r CONFIG_FILE ; do
    ln -s "${DOTFILES_DIR}/${CONFIG_FILE}"
done <"$DOTFILES_DIR/config_files.txt"
