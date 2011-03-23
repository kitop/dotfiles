"manage buffers efectively
set hidden
"sintax highlighting
syntax enable
"line numbers
set number
"row and column of the cursor
set ruler
"highlight search results
set hlsearch
"search while you type
set incsearch
"autoindent
set autoindent
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


