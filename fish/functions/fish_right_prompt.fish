function fish_right_prompt -d "Write out the right prompt"
	#if test $status = 0
	#	echo -n (set_color green)
	#else
	#	echo -n (set_color red)
	#end
	set -l color_time $fish_color_user
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_time red
        end
    end
    echo (set_color $color_time) (date '+%H:%M:%S')
end
