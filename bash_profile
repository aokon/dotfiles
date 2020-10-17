export CLICOLOR=1

# add vi mode into terminal
set -o vi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load bashrc
