#!/usr/bin/bash

# Aliases
alias ls="exa --long --all --tree --level=1 --icons"
alias df="duf /"
alias wt="curl wttr.in/\?0"
alias f="fzf --preview 'clear && bat --color=always {}'"

# Path ENV
export PATH="$PATH:/usr/local/bin"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(starship init bash)"
eval "$(zoxide init bash)"

# Write the following line near the top of .bashrc
[[ $- == *i* ]] && source "$HOME/blesh/ble.sh" --rcfile "$HOME/.blerc"

# Normal settings can be placed in between.

# Write the following line at the bottom of .bashrc
[[ ${BLE_VERSION-} ]] && ble-attach

# Show system information
clear && bfetch

lol() {
  ASCII=$(find /usr/share/cows -name "*.cow" | shuf -n 1)
  fortune | cowsay -f "$ASCII" | lolcat
}

