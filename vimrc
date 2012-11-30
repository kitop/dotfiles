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
colorscheme evening
"Enable extended % matching
runtime macros/matchit.vim
"Store temp files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"persistent undo -  vi 7.3
"set undofile
"set undodir=~/.vim/undodir
"set undolevels = 1000 "maximum number of changes that can be undone
"set undoreload = 10000 "maximum number lines to save for undo on a buffer reload


" use w!! to sudo :w  a file that we opened without su privs
cmap w!! w !sudo tee % >/dev/null

" screen plugin config. use tmux
let g:ScreenImpl = 'Tmux'
let g:ScreenShellInitialFocus = 'shell'
let g:ScreenShellQuitOnVimExit = 1


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

map <c-right> :tabn<cr>
map <c-left> :tabp<cr>
map tt :tabedit<Space>

"screen and faster testing
map <F5> :ScreenShellVertical<CR>
command -nargs=? -complete=shellcmd W  :w | :call ScreenShellSend("load '".@%."';")
map <Leader>r :w<CR> :call ScreenShellSend("rspec ".@% . ':' . line('.'))<CR>
map <Leader>e :w<CR> :call ScreenShellSend("cucumber --format=pretty ".@% . ':' . line('.'))<CR>
map <Leader>b :w<CR> :call ScreenShellSend("break ".@% . ':' . line('.'))<CR>

" pathogen
call pathogen#infect()
