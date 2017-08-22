" Vimrc
"
" This file contains the minimal settings to set the foundation, with the
" majority of the configuration and settings living in files spread between
" vim/rcfiles and vim/rcplugins
set nocompatible

" Need to set the leader before defining any leader mappings
let mapleader = ","

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call plug#begin('~/.vim/bundle')
call s:SourceConfigFilesIn('rcplugins')
call plug#end()

call s:SourceConfigFilesIn('rcfiles')

" -- Configs below here will be moved to their own files

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

augroup END
set exrc
set secure

if $TMUX == ''
  set clipboard+=unnamed
endif

set encoding=utf-8
"manage buffers efectively
set hidden
"sintax highlighting
syntax enable
"row and column of the cursor
set ruler
" higlight current line
set cursorline
"see the actual mode
set showmode
"see the actual command
set showcmd
"indent depending on the filetype
filetype plugin indent on
"Enable extended % matching
runtime macros/matchit.vim
"visual autocomplete for command menu
set wildmenu
set wildmode=full
"set lazyredraw          " redraw only when we need to.
"Store temp files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set terminal title
set title
"no audible bell, just flash the screen
set visualbell
" Toggle paste mode while in insert mode with F12
set pastetoggle=<F12>
" start the scrolling three lines before the border
set scrolloff=3
" Don't add the comment prefix when I hit enter or o/O on a comment line.
set formatoptions-=or
" Open new split panes to right and bottom, which feels more natural than
" Vim’s default:
set splitbelow
set splitright
" make backspace work like most other apps
set backspace=2

autocmd VimResized * :wincmd =

" Switch between the last two files
nnoremap <leader><leader> <C-^>

" Emacs-like beginning and end of line.
imap <C-e> <c-o>$
imap <C-a> <c-o>^
map <C-a>  <Home>
map <C-e>  <End>

" Make j & k linewise
" turn off linewise keys -- normally, the `j' and `k' keys move the cursor down
" one entire line. with line wrapping on, this can cause the cursor to actually
" skip a few lines on the screen because it's moving from line N to line N+1 in
" the file. I want this to act more visually -- I want `down' to mean the next
" line on the screen
map j gj
map k gk

"Make Y yank to end of line (like D, or C)
nmap Y y$

" Don't use arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" use w!! to sudo :w  a file that we opened without su privs
cmap w!! w !sudo tee % >/dev/null

" Do not use <Ctrl-c> to break out to normal mode
" Use C-Space to Esc out of any mode
nnoremap <C-Space> <Esc>:noh<CR>
vnoremap <C-Space> <Esc>gV
onoremap <C-Space> <Esc>
cnoremap <C-Space> <C-c>
inoremap <C-Space> <Esc>`^
" Terminal sees <C-@> as <C-space> WTF, but ok
nnoremap <C-@> <Esc>:noh<CR>
vnoremap <C-@> <Esc>gV
onoremap <C-@> <Esc>
cnoremap <C-@> <C-c>
inoremap <C-@> <Esc>`^

" inserts the current filename without the extension at the cursor position
inoremap \fn <C-R>=expand("%:t:r")<CR>

"
" Visual {
set showmatch "Show matching brackets
set relativenumber
set synmaxcol=200
" }
" Searching {
set hlsearch                    " hilight searches, map below to clear
set incsearch                   " do incremental searching
set ignorecase                  " Case insensitive...
set smartcase                   " ...except if you use UCase
" }
"
" Indenting {
"autoindent
set autoindent
set smarttab
set tabstop=2
set shiftwidth=2
set shiftround
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
" }
" make uses real tabs
au FileType make set noexpandtab


map <C-Right> :tabn<CR>
map <C-Left> :tabp<CR>
map <leader>z :tabedit<Space>
map <leader>m :CtrlP<CR>
map <leader>. :CtrlPTag<cr>

nmap <leader>p :set paste!<CR>:set paste?<CR>
nmap \n :setlocal relativenumber!<CR>:setlocal relativenumber?<CR>

nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>


" Edit another file -- important to keep that trailing space
map <Leader>e :e
map <Leader>s :split
map <Leader>v :vnew

