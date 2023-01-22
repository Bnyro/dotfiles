alias ls="exa --long --all --tree --level=1 --icons"
alias df="duf /"
set fish_greeting
bfetch
starship init fish | source
zoxide init fish | source

function mkcd
    mkdir "$argv[1]"
    cd "$argv[1]"
end