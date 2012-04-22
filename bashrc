# Set the base PS1
PS1="\u:\h \W$"

# Source the git bash completion file
if [ -f ~/.git-completion.sh ]; then
    source ~/.git-completion.sh
    GIT_PS1_SHOWDIRTYSTATE=true
    PS1='\u@\h$(__git_ps1 " (%s)") \W$ '
fi

export PS1

# Aliases
alias ll='ls -Fls'
alias vi='vim'
