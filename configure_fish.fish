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
        functions/fish_mode_prompt.fish \
        functions/fish_prompt.fish \
        solarized.fish
    for config_file in $config_files
        ln -is "$script_dir/fish/$config_file" "$HOME/.config/fish/$config_file"
    end
end

main $argv
