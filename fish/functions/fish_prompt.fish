function fish_prompt --description 'Write out the prompt'
	# Save the return status of the previous command
    set stat $status

    # Time segment
    function timestamp
        printf '%s[%s%s%s]%s' (set_color brred) (set_color yellow) (date "+%H:%M:%S") (set_color brred) (set_color reset)
    end

    # User segment
    function prompt_user
        printf '%s%s%s' (set_color blue) "$USER" (set_color reset)
    end

    # Host segment
    function local_prompt_host
        printf '%s%s%s' (set_color $fish_color_host) (prompt_hostname) (set_color reset)
    end

    # Working directory segment
    function local_prompt_pwd
        printf '%s%s%s' (set_color $fish_color_cwd) (prompt_pwd) (set_color reset)
    end

    # Status segment
    function prompt_status
        set stat $argv[1]
        # Set the color for the status depending on the value
        set status_color (set_color green)
        if test $stat -gt 0
            set status_color (set_color --bold red)
        end
        printf '%s(%s)%s' "$status_color" "$stat" (set_color reset)
    end

    # Separator
    function prompt_separator
        printf '%sΞ%s' (set_color brred) (set_color reset)
    end

    switch "$USER"
        case root toor
            printf '%s@%s %s%s# ' $USER (local_prompt_host) (local_prompt_pwd) (set_color normal)
        case '*'
            printf '%s %s@%s %s %s %s%s \f\r> ' (timestamp) (prompt_user) (local_prompt_host) (prompt_separator) (local_prompt_pwd) (prompt_status "$stat") (set_color normal)
    end
end
