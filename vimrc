" Basics {
  set nocompatible
  " buffer becomes hidden when it is abandoned
	set hidden
" }

" Setup Vundle {
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  " vundle self-management
  Plugin 'gmarik/vundle'

  " general vim improvements
  Plugin 'Raimondi/delimitMate'
  Plugin 'bling/vim-bufferline'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'godlygeek/tabular'
  Plugin 'tpope/vim-surround'
  Plugin 'vim-scripts/YankRing.vim'

  " file navigation
  Plugin 'aokon/vim-bufexplorer'
  Plugin 'kien/ctrlp.vim'
  Plugin 'scrooloose/nerdtree'

  " searching
  Plugin 'mileszs/ack.vim'

  " code completion
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'ervandew/supertab'

  " git related
  Plugin 'airblade/vim-gitgutter'
  Plugin 'tpope/vim-fugitive'

  " better developer experience
  Plugin 'SirVer/ultisnips'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'vim-airline/vim-airline'
  Plugin 'craigemery/vim-autotag'
  Plugin 'w0rp/ale'

  " support for syntax
  Plugin 'sheerun/vim-polyglot'

  " Ruby related
  Plugin 'tpope/vim-bundler'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-rake'

  call vundle#end()
" }

" General {
  " syntax highlighting
	syntax on
	scriptencoding utf-8
  filetype off
  " Automatically detect file types.
	filetype plugin indent on

  " how many lines of history to remember
	set history=100
  " automatically enable mouse usage
	set mouse=a
  " don't make noise on error messages
	set noerrorbells
  " don't blink
	set novisualbell
	set autowrite
  set spell spelllang=en_gb

  if system('uname -s') == "Darwin\n"
    set clipboard=unnamed "OSX
  else
    set clipboard=unnamedplus "Linux
  endif

" }

" Setting up the directories {
  "set backup
  set backupdir=$HOME/.vimbackup
  set directory=$HOME/.vimswap

  " Creating directories if they don't exist
  silent execute '!mkdir -p $HOME/.vimbackup'
  silent execute '!mkdir -p $HOME/.vimswap'

  set nobackup
  set noswapfile
" }

" Vim UI {
  " Assume a light background
  set background=light
  " load a colorscheme
	color solarized
  " highlight current line
	set cursorline
  " display the current mode
	set showmode

	if has('cmdline_info')
    " show the ruler
		set ruler
    " a ruler on steroids
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    " show partial commands in status line and
		set showcmd
	endif

  " do not redraw while running macros (much faster) (LazyRedraw)
	set lazyredraw
  " what to show when I hit :set list
	set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

  " make backspace work normal (indent, eol, start)
	set backspace=indent,eol,start
  " could be < 0
	set linespace=0
  " Line numbers on
	set number
  " show matching brackets/parenthesis
	set showmatch
  " find as you type search
	set incsearch
  " highlight search terms
	set hlsearch
  " windows can be 0 line high
	set winminheight=0
  " case insensitive search
	set ignorecase
  " case sensitive when uc present
	set smartcase
  " show list instead of just completing
	set wildmenu
  " command <Tab> completion, list matches, then longest common part, then all.
	set wildmode=list:longest,full
  " allow backspace and cursor keys to cross line boundaries
	set whichwrap+=<,>,[,]
  " lines to scroll when cursor leaves screen
	set scrolljump=0
  " minimum lines to keep above and below cursor
	set scrolloff=5
  " auto fold code
	set foldenable
  " the /g flag on :s substitutions by default
	set gdefault
" }

" Formatting {
  " wrap long lines
	set wrap
  " indent at the same level of the previous line
	set autoindent
  " smart autoindenting for C programs
	set smartindent
  " use indents of 2 spaces
	set shiftwidth=2
  " don't use tabs
	set expandtab
	set tabstop=2
	set softtabstop=2
  set colorcolumn=100
	set nosmarttab

  " pastetoggle (sane indentation on pastes)
	set pastetoggle=<F12>
	set formatoptions+=n

  autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
  autocmd BufNewFile,BufRead *.less set filetype=less
  autocmd BufNewFile,BufRead *.phtml set filetype=php
  autocmd BufNewFile,BufRead Capfile set filetype=ruby
  autocmd BufNewFile,BufRead *.es6 setfiletype javascript
" }


" Highlight whitespaces {
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
" }

" Folding {
  " Turn on folding
	set foldenable
  " Make folding 'indent' sensitive or not
	set foldmethod=syntax
  " Don't autofold anything (but I can still fold manually)
	set foldlevel=100
  " don't open folds when you undo stuff
	set foldopen-=undo
" }

" Key Mappings {
  " Wrapped lines goes down/up to next row, rather than next line in file.
  noremap j gj
  noremap k gk

  " no more esc
  inoremap <C-C> <Esc>

  " Fast saving
  nmap <Leader>w :w<CR>

  " Run ack
  nmap <Leader>a <Esc>:Ack!

  " use ctags via crtp
  noremap <Leader>f :CtrlPTag<cr>

  " Toggle light/dark backgrounds
  " based on https://github.com/csswizardry/dotfiles/blob/b5f055ce7a189e5dc5bed49a6f9d4e052e7662eb/.vimrc#L241-L242
  nnoremap <Leader>bg :let &background = (&background == "dark" ? "light" : "dark")<CR>
" }

" Plugins {
  " BufferExplorer {
      map <C-B> :BufExplorer<CR>
  " }

  " YouCompleteMe {
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_min_num_identifier_candidate_chars = 2
    let g:ycm_show_diagnostics_ui = 0
  " }

  " Delimitmate {
    au FileType * let b:delimitMate_autoclose = 1
    " If using html auto complete (complete closing tag)
    au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"
  " }

	" AutoCloseTag {
		" Make it so AutoCloseTag works for xml and xhtml files as well
    au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
	" }

  " ctrlp {
    let g:ctrlp_working_path_mode = 'ra'
    nnoremap <silent> <leader>s :CtrlP<CR>
    set wildignore+=*/tmp/*
    set wildignore+=*/bower_components/*
    set wildignore+=*/node_modules/*
    let g:ctrlp_custom_ignore = {
                    \ 'dir': '\.git$\|\.hg$\|\.svn$',
                    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
  "}

  " NerdTree {
    map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.svn', '\.bzr']
    let NERDTreeChDirMode=0
    let NERDTreeMouseMode=2
    let NERDTreeKeepTreeInNewTab=1
  " }

  " UltiSnips {
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-k>"
    let g:UltiSnipsJumpBackwardTrigger="<c-l>"
  " }

  " Ale {
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_enter = 0
    let g:ale_completion_enabled = 0
  " }
" }
