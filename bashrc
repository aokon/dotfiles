export CLICOLOR=1

set -o vi #add vi mode into terminal

[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases" # Load bash_aliases

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
