#!/usr/bin/env bash
# replace_dotfiles.sh
# link all configuration files in the DOTFILES directory to the current user's
# home directory, replacing any preexisting files

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$HOME" >/dev/null
while read -r CONFIG_FILE ; do
    if [ -d "$CONFIG_FILE" ] ; then
        "skipping directory: $CONFIG_FILE"
    else
        if [ -f "$CONFIG_FILE" ] ; then
            rm "$CONFIG_FILE"
        fi
        ln -s "${DOTFILES_DIR}/${CONFIG_FILE}"
    fi
done <"$DOTFILES_DIR/config_files.txt"
