export PATH="/usr/local/bin:$PATH"

export GO111MODULE=on
export GOPATH=$HOME/code/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
export PATH="$PATH:$HOME/dotfiles/bin"
export PATH="$PATH:/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin"

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

alias grep="rg"
alias ack="rg"

# Hub
if hub --version >/dev/null 2>&1; then eval "$(hub alias -s)"; fi

# Prevent iTerm from closing when hitting Control-D
export IGNOREEOF=25

export TIL_STORAGE_PATH="$HOME/til"

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby() {
  source /opt/dev/sh/chruby/chruby.sh
  chruby "$@"
}; }

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

eval "$(starship init bash)"

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/cjoudrey/.kube/config:/Users/cjoudrey/.kube/config.shopify.cloudplatform:/Users/cjoudrey/.kube/config.shopify.production-registry
for file in /Users/cjoudrey/src/github.com/Shopify/cloudplatform/workflow-utils/*.bash; do source ${file}; done
kubectl-short-aliases

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }
