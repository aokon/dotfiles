dotfiles
========

About
-----

Package contains my personal development setup for unix systems.
It contains:

- Custom bash aliases
- hgignore and gitignore rules
- ruby gems config
- personal git config
- personal bash_aliases
- vim package based on pathogen

Vim package
-----------

Vim package includes following plugins:

- checksyntax
- bufexplorer
- crtlp
- endwise
- fugitive
- YouCompleteMe
- nerdtree
- rails
- rake
- scss
- coffee-script
- ri
- taglist
- supertab
- textile
- vim-railscasts-theme
- yankring
- nerdcommenter
- surround
- tags

Instalation
-----------

Clone this repository in your local dir and make symlink for selected util in your $HOME dir.
In the next step run `git submodule init` and `git submodule update` to fetch latest version of vim's plugins.
YouCompleteMe requires additional setup, so please go to the bundle/YouComplete and read the README.

Updating vim plugins
--------------------

Updating the vim plugins is easy, just run `git submodule foreach git pull origin master`.
