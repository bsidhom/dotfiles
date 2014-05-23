#!/usr/bin/env bash
# backup configuration files in the user's home directory to the given directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

read -r -p "enter backup directory: " BACKUP_DIR
# get canonical path of given directory; 
# doesn't work on systems where readlink -f doesn't work
while [[ -a "$BACKUP_DIR" && ! ( -d "$BACKUP_DIR" ) ]] ; do
    BACKUP_DIR=`readlink -f "$BACKUP_DIR"` >/dev/null 2>&1
    echo "backup directory '$BACKUP_DIR' exists and is not a directory"
    read -r -p "Enter backup directory: " BACKUP_DIR
done
if [ ! \( -a "$BACKUP_DIR" \) ] ; then
    mkdir "$BACKUP_DIR"
fi

pushd "$HOME" >/dev/null
cat "${DOTFILES_DIR}/static_files.txt" "${DOTFILES_DIR}/dynamic_files.txt" | while read -r CONFIG_FILE ; do
    if [ -f "$CONFIG_FILE" ] ; then
        cp "$CONFIG_FILE" "$BACKUP_DIR"
    else
        echo "bad or missing config file: $CONFIG_FILE"
    fi
done
