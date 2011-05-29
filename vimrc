" Set encoding
set encoding=utf-8
"manage buffers efectively
set hidden
"sintax highlighting
syntax enable
"row and column of the cursor
set ruler
"see the actual mode
set showmode
"see the actual command
set showcmd
"indent depending on the filetype
filetype plugin indent on
"colorscheme desert
colorscheme desert
"Enable extended % matching
runtime macros/matchit.vim
"Store temp files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


"
" Visual {
set showmatch "Show matching brackets
set number
" }
" Searching {
set hls "Higlight search
set hlsearch
set incsearch " ...dynamically as they are typed.
set ignorecase
set smartcase
" }
"
" Indenting {
"autoindent
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
" }
" make uses real tabs
au FileType make set noexpandtab


" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.rl set ft=ragel
au BufRead,BufNewFile *.txt call s:setupWrapping()

map <c-left> :tabn<cr>
map <c-right> :tabp<cr>
