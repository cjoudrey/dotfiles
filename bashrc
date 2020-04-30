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

# Set the base PS1
PS1="\[\033[1;30m\]\w\[\033[00m\]"

# Source the git bash completion file
if [ -f ~/.git-completion.sh ]; then
    source ~/.git-completion.sh
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    PS1=$PS1'\[\033[32m\]$(__git_ps1 " (%s)")\[\033[00m\]'
fi

source ~/dotfiles/kube-ps1/kube-ps1.sh
PS1='[\u@\h \W $(kube_ps1)]'
# Set prompt
PS1=$PS1" $ "
export PS1

# Aliases
alias ll='ls -Fls'
alias vi='vim'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias be='bundle exec'

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
