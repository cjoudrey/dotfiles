# Load bashrc (if available)
[[ -s "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

#[[ -s "rbenv" ]] && . "$(rbenv init -)"

# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# MySQL
export PATH="/usr/local/mysql/bin:$PATH"
alias mysqld="sudo /Library/StartupItems/MySQLCOM/MySQLCOM"

# NodeJS
export PATH="/usr/local/share/npm/bin:$PATH"
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi
