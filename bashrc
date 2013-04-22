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

# Ruby performance tweaks (https://gist.github.com/1688857)
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000

# Colorize grep by default
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;37;41"

# Hub
eval "$(hub alias -s)"
