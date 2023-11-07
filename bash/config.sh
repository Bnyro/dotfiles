#!/usr/bin/bash

# Aliases
alias ls="lsd -l"
alias df="duf /"
alias wt="curl wttr.in/\?0"

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

## automatically ls when using cd
cd() {
  builtin cd "$@" && ls
}
