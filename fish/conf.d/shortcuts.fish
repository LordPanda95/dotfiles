# Shorten things
alias ..="cd .."
alias ...="cd ../../"
#alias ll="ls -alh"
alias ll="exa -alg"
#alias la="ls -A"
alias lt="exa --long --all --tree"
alias c="clear"
alias colors="$HOME/colors.sh"
alias vim="nvim"

#fzf_configure_bindings --directory=\cf --variables=\e\cv
#fzf_configure_bindings --

# If your terminal supports colors, use them!
#alias ls="ls --color=auto"
#alias grep="grep --color=auto"
#alias fgrep="fgrep --color=auto"
#alias egrep="egrep --color=auto"
#alias diff="colordiff"

function tfp
    command terraform validate
    command terraform fmt -recursive
    command terraform plan
end

function git-clean-bze
    command git branch | grep 'BZE*' | xargs git branch -D
end
