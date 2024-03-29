# ubuntu
alias ai='sudo apt install'
alias au='sudo apt update'
alias aug='sudo apt upgrade'
alias alu='apt list --upgradable'
alias as='apt-cache search'

# general utils
alias ct='ctags -R .'
alias v='vim -c NERDTree 2> /dev/null'
alias nv='nvim -c NERDTree 2> /dev/null'
alias c='clear'
alias ll='ls -al'
alias l='ls -l'
alias g='git'
alias o='overmind'
alias aws='/usr/local/bin/aws'

#rails/ruby
alias r='rails'
alias br='bin/rails'
alias brc='bin/rspec'
alias b='bundle'
alias be='b exec'
alias bi='b install'
alias bu='b update'
alias bo='b outdate'
alias bon='b open'
alias ba='b add'
alias rdm='br db:migrate'
alias rdr='br db:rollback'

# elixir
alias m="mix"
alias iex='iex --erl "-kernel shell_history enabled"'

# tmux
alias t='tmux -u'
alias tmr='tmuxinator'

# frontend tools
alias n='npm'
alias y='yarn'
alias yr='y run'
alias yo='y outdated'
alias ya='y add'
alias no='n outdated'
alias nr='n run'
alias ugh='rm -rf node_modules/ && npm cache clean && n i'

#docker
alias dk='docker'
alias di='dk images -a'
alias dsp='dk system prune -a'
alias dco='dk compose'

alias cma='colima'
alias cst='cma start --vm-type vz --mount-type virtiofs --memory 4'
