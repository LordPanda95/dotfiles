function fish_prompt --description 'Write out the prompt'
    # Color the prompt differently when we're root
    set new_line_color $fish_color_user
    set fish_color_user $fish_color_user
    set fish_color_host $fish_color_host
    set -l color_cwd $fish_color_cwd
    set -l suffix '❯'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
            set fish_color_user red
            set new_line_color red
            set fish_color_host white
        end
        set suffix '#'
    end
    echo -n -s (set_color $new_line_color)"╭─" (whoami) " " (set_color $fish_color_host) (prompt_hostname) (set_color brwhite)  " "
    echo -e ""
    echo (set_color $new_line_color)"│" (set_color $color_cwd) (prompt_pwd) " "
    #echo -e ""
    echo (set_color $new_line_color)"╰─" $suffix " "
end
