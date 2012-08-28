" Needed for pathogen (loads other plugins)
call pathogen#infect()
syntax on
filetype plugin indent on

set t_Co=256
" colorscheme railscasts
colorscheme robinhood

" Disable the toolbar
set go-=T

" Turn on line numbers
set number

" Copying from buffer doesn't copy the line numbers
set mouse=a

" Selecting text will copy it
" noremap <LeftRelease> "+y<LeftRelease>

" Control + C will copy text
vmap <C-C> "+y

" Control + X will cut text
vmap <C-X> "+d

" Allows vi to have multiple unsaved buffers
"set hidden

" Sets movement keys to ijkl and insert to h
noremap k j
noremap j h
noremap i k
noremap h i

" Switch between splits with Ctrl+I and Ctrl+K
map <C-I> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" Switch between buffers with Shift+J and Shift+L
nnoremap <S-J> :bprevious<CR>
nnoremap <S-L> :bnext<CR>

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
