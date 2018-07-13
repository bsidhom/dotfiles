function fish_prompt --description 'Write out the prompt'
	# Save the return status of the previous command
    set stat $status

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
        #printf '%s%s%s' (set_color "$fish_color_cwd") (prompt_pwd) (set_color reset)
        printf '%s%s%s' (set_color --background=blue 002b36) (prompt_pwd) (set_color reset)
    end

    # Status segment
    function prompt_status
        set stat $argv[1]
        # Set the color for the status depending on the value
        set status_color (set_color -o green)
        if test $stat -gt 0
            set status_color (set_color -o red)
        end
        printf '%s(%s)%s' "$status_color" "$stat" (set_color reset)
    end

    switch "$USER"
        case root toor
            printf '%s@%s %s%s# ' $USER (local_prompt_host) (local_prompt_pwd) (set_color normal)
        case '*'
            printf '[%s] %s@%s Ξ %s %s%s \f\r> ' (date "+%H:%M:%S") (prompt_user) (local_prompt_host) (local_prompt_pwd) (prompt_status "$stat") (set_color normal)
    end
end
