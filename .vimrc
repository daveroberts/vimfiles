" Needed for pathogen (loads other plugins)
call pathogen#infect()
syntax on
filetype plugin indent on

set t_Co=256 " Allow 256 colors in terminal
" colorscheme railscasts
set gfn=Droid\ Sans\ mono\ 12
colorscheme navajo-night

set go-=T " Disable the toolbar in gvim
set number " Turn on line numbers
set mouse=a " Copying from buffer doesn't copy the line numbers
" Control + C will copy text
vmap <C-C> "+y
" Control + X will cut text
vmap <C-X> "+d
"set hidden " Allows vi to have multiple unsaved buffers

" Sets movement keys to ijkl and insert to h
noremap k j
noremap j h
noremap i k
noremap h i

" Page up and down with Shift+I and Shift+K
nnoremap <S-I> <PageUp>
nnoremap <S-K> <PageDown>
nnoremap <C-I> <PageUp>
nnoremap <C-K> <PageDown>

" Tell VIM during motion commands to try to preserve column where cursor is positioned
set nostartofline

" Close buffer with Ctrl+Q
nnoremap <C-Q> :bd<CR>

" Sets Leader key to , instead of \
let mapleader = ","

" Let's you escape input mode with jj instead of Escape
:imap jj <Esc>

" Leader n will toggle NERD tree
" map <leader>n :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>

" Sets CtrlP to ff
map ff :CtrlP<CR>

" Sets CtrlP search to ancestor with .git or pwd or dir of current file
let g:ctrlp_working_path_mode = 'ra'

" When tab is pressed, expand to spaces
:set expandtab

" Set tab to two spaces
:set tabstop=2
:set shiftwidth=2

" When enter is hit, try to indent to the right place
:set smartindent

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/     

" Remaps : to ;
nnoremap ; :

map ss :call ToggleSplit()<CR>

function! ToggleSplit()
  if len(tabpagebuflist()) > 1
    :close
  else
    :vsplit
  endif
endfunction

map <C-L> :call MoveRight()<CR>
map <C-J> :call MoveLeft()<CR>
" Switch between buffers with Shift+J and Shift+L
nnoremap <S-J> :bprevious<CR>
nnoremap <S-L> :bnext<CR>

function! MoveRight()
  if len(tabpagebuflist()) > 1
    :exe "normal \<C-W>\<C-w>"
  else
    :bnext
  endif
endfunction

function! MoveLeft()
  if len(tabpagebuflist()) > 1
    :exe "normal \<C-W>\<C-w>"
  else
    :bprev
  endif
endfunction

"Save File on every keystroke
"
"function! WriteFile() 
"  if &buftype == ""
"    write
"  endif
"  return '%f %h%w%m%r%=%-14(%l,%c%V%) %(%P%)'
"endfunction
"setlocal statusline=%!WriteFile()
"set laststatus=2
