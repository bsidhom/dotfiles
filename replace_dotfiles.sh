#!/usr/bin/env bash
# replace_dotfiles.sh
# copy all configuration files in the DOTFILES directory to the current user's
# home directory, replacing any preexisting files

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$HOME" >/dev/null
while read -r CONFIG_FILE ; do
    if [ -d "$CONFIG_FILE" ] ; then
        "skipping directory: $CONFIG_FILE"
    else
        if [ -f "$CONFIG_FILE" ] ; then
            echo "overwriting configuration file: $CONFIG_FILE"
        fi
        cp "${DOTFILES_DIR}/${CONFIG_FILE}" ./
    fi
done <"$DOTFILES_DIR/static_files.txt"
while read -r CONFIG_FILE ; do
    if [ -d "$CONFIG_FILE" ] ; then
        "skipping directory: $CONFIG_FILE"
    else
        if [ -f "$CONFIG_FILE" ] ; then
            echo "overwriting configuration file: $CONFIG_FILE"
        fi
        envsubst <"${DOTFILES_DIR}/${CONFIG_FILE}" >"./${CONFIG_FILE}"
    fi
done <"$DOTFILES_DIR/dynamic_files.txt"
