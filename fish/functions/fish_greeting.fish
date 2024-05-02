function fish_greeting
    set -l color bryellow
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color red
        end
    end
    echo -e ''
    echo Hello (set_color $color; echo $USER; set_color normal)
    echo This machine is (set_color $color; prompt_hostname; set_color normal)
    echo The time is (set_color $color; date +%T; set_color normal)
    echo -e ''
end
