#!/usr/bin/env bash
# remove_dotfiles.sh
# remove configuration files from user's home directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd "$HOME" >/dev/null
while read -r CONFIG_FILE ; do
    if [ -f "$CONFIG_FILE" ] ; then
        rm "$CONFIG_FILE"
    else
        echo "bad or missing config file: $CONFIG_FILE"
    fi
done <"$DOTFILES_DIR/config_files.txt"
