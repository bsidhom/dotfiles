#!/usr/bin/env bash
# backup configuration files in the user's home directory to the given directory

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

read -r -p "Backup dotfiles? [Y/n] " backup
case "$backup" in
    [Nn][Oo]|[Nn])
        # don't perform backup
        ;;
    *)
        "$DOTFILES_DIR/backup_dotfiles.sh"
        ;;
esac

"$DOTFILES_DIR/replace_dotfiles.sh"
"$DOTFILES_DIR/link_submodules.sh"
