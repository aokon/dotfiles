#ubuntu
alias ai='sudo apt-get install'
alias as='apt-cache search'

# general utils
alias ct='ctags -R .'
alias v='nvim -c NERDTree 2> /dev/null'
alias c='clear'

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
alias rdm='brk db:migrate'
alias rdr='brk db:rollback'

#frontend tools
alias n='npm'
alias y='yarn'
alias no='n outdated'
alias nr='n run'
alias ugh='rm -rf node_modules/ && npm cache clean && ni'

#docker
alias di='docker images -a'
alias dsp='docker system prune -a'
alias dco='docker-compose'

#git
alias gta='git add'
alias gco='git commit -m'
alias gc='git checkout'
alias gts='git status'
alias giff='git diff'
alias gpf='git push --force-with-lease'
alias gpu='git push'
alias gp='git pull'
alias gb='git branch'
alias gri='git rebase -i'
alias gm='git merge'
alias amend='git commit --amend --no-edit'
