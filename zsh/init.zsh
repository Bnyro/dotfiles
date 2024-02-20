#!/usr/bin/zsh

# Aliases
alias ls="lsd -l"
alias df="duf /"

# Path environment variable
export PATH="$PATH:/usr/local/bin:$HOME/.config/scripts"

# Completions paths
fpath=(/usr/share/zsh/site-functions $fpath)

# Generic coloriser
[[ -s "/usr/share/grc/grc.zsh" ]] && source /usr/share/grc/grc.zsh

# Starship
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Auto suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load completions
autoload -Uz compinit && compinit

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

clear && bfetch
