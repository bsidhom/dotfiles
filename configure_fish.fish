#!/usr/bin/env fish


function main
    set -l script_dir (cd (dirname (status -f)); and pwd) 
    if test ! -e ~/.config/fish
        mkdir ~/.config/fish
    end
    if test ! -e ~/.config/fish/functions
        mkdir ~/.config/fish/functions
    end
    set -l config_files \
        config.fish \
        solarized.fish \
        functions/fish_prompt.fish
    for config_file in $config_files
        # TODO: Prompt to overwrite if file already exists.
        ln -s "$script_dir/fish/$config_file" "$HOME/.config/fish/$config_file"
    end
end

main $argv
