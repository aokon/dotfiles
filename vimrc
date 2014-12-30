" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" This is the personal .vimrc file of Adam Okoń
" based on .vimrc file of Steve Francia (http://spf13.com)
" and Daniel Stokowiec.
" }

" Setup Bundle Support {
" The next two lines ensure that the ~/.vim/bundle/ system works
	runtime! autoload/pathogen.vim
	silent! call pathogen#runtime_append_all_bundles()
" }

" Basics {
	set nocompatible  " must be first line
	set hidden        " buffer becomes hidden when it is abandoned
" }


" General {
	syntax on 					" syntax highlighting
	scriptencoding utf-8
    filetype off
	filetype plugin indent on   " Automatically detect file types.

	set history=100             " how many lines of history to remember
	set mouse=a					" automatically enable mouse usage
	set noerrorbells            " don't make noise on error messages
	set novisualbell            " don't blink
	set autowrite

	" Setting up the directories {
		"set backup 					" backups are nice ...
        set backupdir=$HOME/.vimbackup  " but not when they clog .
        set directory=$HOME/.vimswap 	" Same for swap files

		" Creating directories if they don't exist
        silent execute '!mkdir -p $HOME/.vimbackup'
        silent execute '!mkdir -p $HOME/.vimswap'

        set nobackup
        set noswapfile
	" }
" }

" Vim UI {
	color Tomorrow-Night        " load a colorscheme, for gvim in GUI settings
    set background=dark         " Assume a dark background
	set cursorline  		    " highlight current line
	set showmode               	" display the current mode

	if has('cmdline_info')
		set ruler                  	                       " show the ruler
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
		set showcmd                	                       " show partial commands in status line and
									                       " selected characters/lines in visual mode
	endif

	if has('statusline')
		set laststatus=2           	               " always show statusline
		" Use the commented line if fugitive isn't installed
        set statusline=%<%f\ " Filename
        set statusline+=%w%h%m%r " Options
        set statusline+=%{fugitive#statusline()}   " Git Hotness
        set statusline+=\ [%{&ff}/%Y/%{&encoding}] " Filetype
        set statusline+=\ [%{getcwd()}]            " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%    " Right aligned file nav info
	endif

	set lazyredraw                  " do not redraw while running macros (much faster) (LazyRedraw)
	set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list

	set backspace=indent,eol,start 	" make backspace work normal (indent, eol, start)
	set linespace=0					" could be < 0
	set number 						" Line numbers on
	set showmatch          	        " show matching brackets/parenthesis
	set incsearch 					" find as you type search
	set hlsearch 					" highlight search terms
	set winminheight=0 			    " windows can be 0 line high
	set ignorecase 					" case insensitive search
	set smartcase 					" case sensitive when uc present
	set wildmenu 					" show list instead of just completing
	set wildmode=list:longest,full 	" comand <Tab> completion, list matches, then longest common part, then all.
	set whichwrap+=<,>,[,]          " allow backspace and cursor keys to cross line boundaries
	set scrolljump=0 				" lines to scroll when cursor leaves screen
	set scrolloff=5 				" minimum lines to keep above and below cursor
	set foldenable  				" auto fold code
	set gdefault					" the /g flag on :s substitutions by default
" }


" Formatting {
	set wrap                " wrap long lines
	set autoindent          " indent at the same level of the previous line
	set smartindent         " smart autoindenting for C programs
	set shiftwidth=2       	" use indents of 4 spaces
	set expandtab 	       	" dont use tabs
	set tabstop=2 			" an indentation every four columns
	set softtabstop=2
	set nosmarttab

	"set matchpairs+=<:>             " match, to be used with %
	set pastetoggle=<F12>          	 " pastetoggle (sane indentation on pastes)
	"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
	set formatoptions+=n

  "autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
  autocmd BufNewFile,BufRead *.less set filetype=less
  autocmd BufNewFile,BufRead *.phtml set filetype=php
  autocmd BufNewFile,BufRead Capfile set filetype=ruby
  autocmd BufNewFile,BufRead *.handlebars set filetype=html
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
	set foldenable        " Turn on folding
	set foldmethod=syntax " Make folding 'indent' sensitive or not
	set foldlevel=100     " Don't autofold anything (but I can still fold manually)
	set foldopen-=undo    " don't open folds when you undo stuff
" }

" Key Mappings {
	" Easier moving in tabs and windows
	map <C-J> <C-W>j<C-W>
	map <C-K> <C-W>k<C-W>
	map <C-L> <C-W>l<C-W>
	map <C-H> <C-W>h<C-W>

  " Wrapped lines goes down/up to next row, rather than next line in file.
  noremap j gj
  noremap k gk

  " Fast saving
  nmap <leader>w :w<cr>

" }

" Plugins {
  " BufferExplorer {
      map <C-B> :BufExplorer<CR>
  " }
  "

  " YouCompleteMe {
     let g:ycm_collect_identifiers_from_tags_files = 1
     let g:ycm_collect_identifiers_from_comments_and_strings = 1
  " }

   " Ctags {
      set tags=./tags;/,~/.vimtags
      let Tlist_Enable_Fold_Column = 0 " Do not show folding tree
      let Tlist_Show_Menu = 1
      let Tlist_WinWidth = 40          " 40 cols wide, so i can (almost always) read my functions
      let Tlist_Use_Right_Window = 1

      map <leader>t :TlistToggle<CR>

    " }

    " YankRing {
		let g:yankring_history_dir = expand('$HOME') . '/.vimswap'
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

" }
