set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'ElmCast/elm-vim'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'craigemery/vim-autotag'
Plugin 'elixir-lang/vim-elixir'
Plugin 'elzr/vim-json'
Plugin 'garbas/vim-snipmate'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'jplaut/vim-arduino-ino'
Plugin 'junegunn/vim-easy-align'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'kitop/vim-cuba'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tomtom/tlib_vim'
Plugin 'tonchis/vim-to-github'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/logstash.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/tComment'

call vundle#end()            " required
filetype plugin indent on    " required

let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['javascript'] = 'javascript,html'


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
  " Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Appraisals,Thorfile,config.ru} set ft=ruby

augroup END
set exrc
set secure

" Open to linenumber
function! OpenToLineNumber()
  let filename=expand("%")
  let parts=split(filename, ":")
  exec ":e " . parts[0]
  exec ":" . parts[1]
  redraw!
endfunction
autocmd BufNewFile,BufEnter,BufRead *:* nested call OpenToLineNumber()

let mapleader = ","

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
"colorscheme desert
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
"Enable extended % matching
runtime macros/matchit.vim
"visual autocomplete for command menu
set wildmenu
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
" Disable Markdown Folding
let g:vim_markdown_folding_disabled=1

let g:syntastic_ruby_mri_exe='~/.rbenv/shims/ruby'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_eslint_exec = 'eslint_d'

let g:jsx_ext_required = 0 


autocmd VimResized * :wincmd =

"""" STATUSLINE - based on https://github.com/christoomey/dotfiles/blob/master/vim/rcfiles/statusline#L54
set laststatus=2 " Always show the statusline
set statusline= " Clear the statusline for vimrc reloads

"define 3 custom highlight groups
hi User1 ctermbg=lightgray ctermfg=yellow guifg=orange guibg=#444444 cterm=bold gui=bold
hi User2 ctermbg=lightgray ctermfg=red guifg=#dc143c guibg=#444444 gui=none
hi User3 ctermbg=lightgray ctermfg=red guifg=#ffff00 guibg=#444444 gui=bold


set stl=%*                       " Normal statusline highlight
set stl+=%{InsertSpace()}        " Put a leading space in
set stl+=%2*                     " Red highlight
set stl+=%m                      " Modified flag
set stl+=%*                      " Normal 
set stl+=%t                      " Filename
set stl+=%1*                     " Yellow highlight
set stl+=%{HasPaste()}           " Red show paste
set stl+=%*                      " Return to normal stl hilight

set stl+=%r                      " Readonly flag
set stl+=%h                      " Help file flag
set stl+=\ %y                    " Filetype

set stl+=%=                      " Right align from here on
set stl+=\ \ Col:%c              " Column number
set stl+=\ \ Line:%l/%L          " Line # / total lines
set stl+=\ \ %P%{InsertSpace()}  " Single space buffer


function! InsertSpace()
    " For adding trailing spaces onto statusline
    return ' '
endfunction

function! HasPaste()
    if &paste
        return '[paste]'
    else
        return ''
    endif
endfunction

"""" END STATUSLINE

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

"
" Visual {
set showmatch "Show matching brackets
set number
set relativenumber
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

" Remove trailing whitespace on save for specific filetypes.
au BufWritePre *.{rb,rake,js,coffee,haml,css,scss,ex,exs} :call StripTrailingWhitespaces()
function! StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun


map <C-Right> :tabn<CR>
map <C-Left> :tabp<CR>
map <leader>z :tabedit<Space>
map <leader>m :CtrlP<CR>
map <leader>. :CtrlPTag<cr>

let g:to_github_clip_command = 'pbcopy'
let g:to_github_clipboard = 1

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .DS_Store
      \ -g ""'

nmap <leader>p :set paste!<CR>:set paste?<CR>
nmap \n :setlocal number!<CR>:setlocal number?<CR>

nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

let g:rspec_command = "VtrSendCommandToRunner! rspec {spec}"
map <Leader>t :call RunNearestSpec()<CR>
map <Leader>a :call RunCurrentSpecFile()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>r :call RunAllSpecs()<CR>

" Edit another file -- important to keep that trailing space
map <Leader>e :e 
map <Leader>s :split 
map <Leader>v :vnew 

