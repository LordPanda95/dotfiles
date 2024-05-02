if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_config theme choose "Dracula Official"

set -gx BAT_THEME "Dracula"

set fzf_preview_dir_cmd exa -alg
set fzf_fd_opts --hidden --max-depth 5
set fzf_diff_highlighter delta
#set fzf_configure_bindings --history=\c\r

source "$HOME/.cargo/env.fish"

set -gx EDITOR nvim
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_EN.UTF-8
set -gx LANGUAGE en_US.UTF-8

#fzf --fish | source

source /Users/lordpanda/.config/op/plugins.sh
