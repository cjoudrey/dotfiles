# Load bashrc (if available)
[[ -s "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/usr/local/mysql/bin:$PATH"
alias mysqld="sudo /Library/StartupItems/MySQLCOM/MySQLCOM"
