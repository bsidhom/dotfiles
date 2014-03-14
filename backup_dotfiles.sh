#!/usr/bin/env bash
# backup configuration files in the user's home directory to the given directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# get canonical path of given directory; 
# doesn't work on systems where readlink -f doesn't work
BACKUP_DIR=`readlink -f "$1"`
if [ ! \( -d "$BACKUP_DIR" \) ] ; then
    echo "must specify a backup directory (that already exists)"
    exit 1
fi

pushd "$HOME" >/dev/null
while read -r CONFIG_FILE ; do
    if [ -f "$CONFIG_FILE" ] ; then
        cp "$CONFIG_FILE" "$BACKUP_DIR"
    else
        echo "bad or missing config file: $CONFIG_FILE"
    fi
done <"$DOTFILES_DIR/config_files.txt"
