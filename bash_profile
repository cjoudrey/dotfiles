# Boxen
source /opt/boxen/env.sh

# Load bashrc (if available)
[[ -s "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# MySQL
export PATH="/usr/local/mysql/bin:$PATH"
alias mysqld="sudo /Library/StartupItems/MySQLCOM/MySQLCOM"

# NodeJS
export PATH="/usr/local/share/npm/bin:$PATH"
