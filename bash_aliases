alias v='vim -c NERDTree 2> /dev/null'
alias c='clear'

#ubuntu
alias ai='sudo apt-get install'
alias as='apt-cache search'

# general usage
alias ct='ctags -R .'

#rails/ruby
alias r='rails'
alias br='bin/rails'
alias brk='bin/rake'
alias b='bundle'
alias be='b exec'
alias bi='b install'
alias bu='b update'
alias bo='b outdate'
alias rdm='brk db:migrate'
alias rdr='brk db:rollback'

#ember/node
alias e='ember'
alias ni='npm install --save-dev'
alias bwi='bower install --save-dev'
alias ugh='rm -rf node_modules/ bower_components/ && npm cache clean && bower cache clean && ni && bwi'

#osx
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias mysql-start='/usr/local/Cellar/mysql/5.6.17/support-files/mysql.server start'
alias mysql-stop='/usr/local/Cellar/mysql/5.6.17/support-files/mysql.server stop'

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
