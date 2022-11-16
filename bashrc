export PATH="/usr/local/bin:$PATH"

export GO111MODULE=on
export GOPATH=$HOME/code/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
export PATH="$PATH:$HOME/dotfiles/bin"

# Load rvm (if installed)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Load rbenv (if installed)
[[ -s "$HOME/.rbenv" ]] && eval "$(rbenv init -)"

# Set vim as default editor
export EDITOR="vim"

# VI movement in Bash
set -o vi

if [ -f ~/.git-completion.sh ]; then
    source ~/.git-completion.sh
fi

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

# sha256sum
alias sha256sum='shasum -a 256'

# json pretty-print
alias pp='python -mjson.tool'

# fix colors in tmux
alias tmux="TERM=screen-256color-bce tmux"

alias grep="ack"

# Hub
if hub --version >/dev/null 2>&1; then eval "$(hub alias -s)"; fi

# Prevent iTerm from closing when hitting Control-D
export IGNOREEOF=25

export TIL_STORAGE_PATH="$HOME/til"

eval "$(starship init bash)"
