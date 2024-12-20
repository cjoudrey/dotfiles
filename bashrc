[[ -s "$HOME/.rbenv" ]] && eval "$(rbenv init -)"

# Set vim as default editor
export EDITOR="vim"

# VI movement in Bash
set -o vi

# Aliases
alias ll='ls -Fls'
alias vi='vim'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias be='bundle exec'
alias k='kubectl'
alias grep="rg"
alias ack="rg"

eval "$(starship init bash)"
