# ubuntu
alias ai='sudo apt-get install'
alias as='apt-cache search'

# general utils
alias ct='ctags -R .'
alias v='nvim -c NERDTree 2> /dev/null'
alias c='clear'
alias ll='ls -al'
alias l='ls -l'
alias g='git'

#rails/ruby
alias r='rails'
alias br='bin/rails'
alias brk='bin/rake'
alias brc='bin/rspec'
alias b='bundle'
alias be='b exec'
alias bi='b install'
alias bu='b update'
alias bo='b outdate'
alias bon='b open'
alias ba='b add'
alias rdm='brk db:migrate'
alias rdr='brk db:rollback'

# elixir
alias m="mix"
alias iex='iex --erl "-kernel shell_history enabled"'

# tmux
alias t='tmux'
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
alias dco='docker-compose'
