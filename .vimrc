set nocompatible  " required for Vundle
filetype off      " required for Vundle

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Bundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
" github repos
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
" Highlights matching HTML tag
Bundle 'gregsexton/MatchTag'
Bundle 'tpope/vim-rails'
Bundle 'derekwyatt/vim-scala'
Bundle 'kien/ctrlp.vim'
" Bundle 'daviddavis/vim-colorpack'
Bundle 'flazz/vim-colorschemes'
Bundle 'bling/vim-airline'
Bundle 'ervandew/supertab'
Bundle 'corntrace/bufexplorer'

filetype plugin indent on     " required!

syntax on

" Needed for pathogen (loads other plugins)
" call pathogen#infect()
" syntax on
" filetype plugin indent on

set t_Co=256 " Allow 256 colors in terminal
" colorscheme railscasts
set gfn=Droid\ Sans\ mono\ 9
" colorscheme night
colorscheme sienna

" Set cut copy and paste to windows type commands
source $VIMRUNTIME/mswin.vim
behave mswin

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

" Sets Leader key to , instead of \
let mapleader = ","

" Let's you escape input mode with jj instead of Escape
:imap jj <Esc>

" Leader n will toggle NERD tree
" map <leader>n :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>

map <S-H> :LustyJuggler<CR>

" Sets CtrlP to ff
map ff :CtrlP<CR>

" Sets CtrlP search to ancestor with .git or pwd or dir of current file
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 'a'

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

" Remove tailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Remaps : to ;
nnoremap ; :

" Split window vertically with ss
map ss :vsplit<CR>
" Split horizontally with capital SS
map <S-s><S-s> :split<CR>

" Switch buffer with sd
map sd ,be

map <S-L> :call MoveRight()<CR>
map <S-J> :call MoveLeft()<CR>
map <S-I> :call MoveUp()<CR>
map <S-K> :call MoveDown()<CR>

function! MoveRight()
  if len(tabpagebuflist()) > 1
    :exe "normal \<C-W>\<Right>"
  else
    :bnext
  endif
endfunction

function! MoveLeft()
  if len(tabpagebuflist()) > 1
    :exe "normal \<C-W>\<Left>"
  else
    :bprev
  endif
endfunction

function! MoveUp()
  if len(tabpagebuflist()) > 1
    :exe "normal \<C-W>\<Up>"
  else
    :bnext
  endif
endfunction

function! MoveDown()
  if len(tabpagebuflist()) > 1
    :exe "normal \<C-W>\<Down>"
  else
    :bprev
  endif
endfunction

" Close buffer with Ctrl+Q
" Or with qq
" nnoremap <C-Q> :call CloseBuf()<CR>
"map qq :call CloseBuf()<CR>
map qq :bd<CR>

"function! CloseBuf()
"  if len(tabpagebuflist()) > 1
"    :exe "normal \<C-W>\c"
"  else
"    :bd
"  endif
"endfunction

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
