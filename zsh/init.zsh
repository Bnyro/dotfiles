#!/usr/bin/zsh

# Aliases
alias ls="lsd -l"
alias df="duf /"

# Path environment variable
export PATH="$PATH:/usr/local/bin:$HOME/.config/scripts"

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Completions
fpath=(/usr/share/zsh/site-functions $fpath)

# Generic coloriser
[[ -s "/usr/share/grc/grc.zsh" ]] && source /usr/share/grc/grc.zsh

# Starship
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Load completions
autoload -Uz compinit && compinit

clear && bfetch

