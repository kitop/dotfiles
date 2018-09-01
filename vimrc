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

set rtp+=/usr/local/opt/fzf

call plug#begin('~/.vim/bundle')
call s:SourceConfigFilesIn('rcplugins')
call plug#end()

call s:SourceConfigFilesIn('rcfiles')

" -- Configs below here will be moved to their own files

augroup vimrcEx
  autocmd!
augroup END

if $TMUX == ''
  set clipboard+=unnamed
endif

autocmd VimResized * :wincmd =
" make uses real tabs
au FileType make set noexpandtab
