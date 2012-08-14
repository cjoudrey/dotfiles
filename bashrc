# Set the base PS1
PS1="\u"

# Source the git bash completion file
if [ -f ~/.git-completion.sh ]; then
    source ~/.git-completion.sh
    GIT_PS1_SHOWDIRTYSTATE=true
    PS1=$PS1'$(__git_ps1 " (%s)")'
fi

PS1=$PS1" \W$ "

export PS1

# Aliases
alias ll='ls -Fls'
alias vi='vim'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status'
alias ga='git add'
alias gp='git push'

# sha256sum
alias sha256sum='shasum -a 256'
