 #!/bin/zsh

export USER_NAME="aokon"

export EDITOR="vim"

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases" # Load bash_aliases

[[ -s "$HOME/.shared_vars" ]] && source "$HOME/.shared_vars" # Load config variables
