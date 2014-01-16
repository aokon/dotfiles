export CLICOLOR=1                                                           

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#add vi mode into terminal
set -o vi

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
