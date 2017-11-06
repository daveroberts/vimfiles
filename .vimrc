set shell=/bin/sh " required for fish shell
set nocompatible  " required for Vundle
filetype off      " required for Vundle

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Bundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
" github repos

" highlight opposite opening / closing tag
Bundle 'gregsexton/MatchTag'

" search files by filenames and open quickly
Bundle 'ctrlpvim/ctrlp.vim'

" more colors, maybe one I could use
Bundle 'flazz/vim-colorschemes'

" ability to open gnupg encrypted files
Bundle 'jamessan/vim-gnupg'

" go syntax highlighting
Bundle 'fatih/vim-go'

" less syntax highlighting
Plugin 'groenewege/vim-less'

" ES6 syntax highlighting
Plugin 'isRuslan/vim-es6'

" toml highlighting
Plugin 'cespare/vim-toml'

" needed for vim-markdown highlighting
Plugin 'godlygeek/tabular'

" markdown syntax highlighting
Plugin 'plasticboy/vim-markdown'

" gradle syntax highlighting
Plugin 'tfnico/vim-gradle'

" kotlin syntax highlighting
Plugin 'udalov/kotlin-vim'

" nim syntax highlighting
Plugin 'zah/nim.vim'

" JSON syntax highlighting
Plugin 'elzr/vim-json'

" vue.js syntax highlighting
Plugin 'posva/vim-vue'

" elixir syntax highlighting
Plugin 'elixir-editors/vim-elixir'

" asciidoc syntax highlighting
Plugin 'asciidoc/vim-asciidoc'

" rust syntax highlighting
Plugin 'rust-lang/rust.vim'

" scala syntax highlighting
Plugin 'derekwyatt/vim-scala'

" CSS Coloring
Plugin 'ap/vim-css-color'

" Git changes in gutter
Plugin 'airblade/vim-gitgutter'
" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

let g:vim_markdown_folding_disabled = 1 " Don't collapse markdown
let g:vim_json_syntax_conceal = 0 " Don't conceal double quotes in JSON for vim-json

" Automatically display all buffers when there's only one open tab
let g:airline#extensions#tabline#enabled = 1

autocmd FileType vue syntax sync fromstart " Vim syntax highlighting stops working randomly.  This is an attempt to fix that

filetype plugin indent on     " required!

syntax on

" Set swap files to different directory
set directory=$HOME/.vim/swapfiles

set t_Co=256 " Allow 256 colors in terminal
"set gfn=Terminus\ 12
set gfn=Inconsolata\ 14
" set gfn=Monospace\ 12
" colorscheme railscasts
colorscheme tango2
" colorscheme sienna " light background
" colorscheme tolerable " light background

" Set cut copy and paste to windows type commands
source $VIMRUNTIME/mswin.vim
behave mswin

set go-=T " Disable the toolbar in gvim
set number " Turn on line numbers
" set relativenumber " relative numbers
set mouse=a " Copying from buffer doesn't copy the line numbers
" Control + C will copy text
vmap <C-C> "+y
" Control + X will cut text
vmap <C-X> "+d
"set hidden " Allows vi to have multiple unsaved buffers

" Sets movement keys to ijkl and insert to h
" The gj and gk make it move one line on screen, regardless of whether it's
" the same line mapped or not
noremap k gj
noremap j h
noremap i gk
map <S-L> w
map <S-J> b
map <S-K> 5gj
map <S-I> 5gk
noremap h i

" Page up and down with Ctrl+I and Ctrl+K
"nnoremap <C-I> <PageUp>
"nnoremap <C-K> <PageDown>

" Pressing , or . will let you indent/unident selected lines
vnoremap , <gv
vnoremap . >gv

" Tell VIM during motion commands to try to preserve column where cursor is positioned
set nostartofline

" Sets Leader key to , instead of \
let mapleader = ","

" Let's you escape input mode with jj instead of Escape
:imap jj <Esc>
":imap <C-c> <Esc>

" Leader n will toggle NERD tree
" map <leader>n :NERDTreeToggle<CR>

" Sets CtrlP to ff
map ff :CtrlP<CR>

" Highlight as you type
set incsearch
" case insensitive
set ignorecase
" except for upper case
set smartcase
" turn on highlighting
set hlsearch
" Turn off highlighting with F3
nnoremap <F3> :noh<CR>

" Sets CtrlP search to ancestor with .git or pwd or dir of current file
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 'a'

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" When tab is pressed, expand to spaces
:set expandtab

" Set tab to two spaces
:set tabstop=2
:set shiftwidth=2

" When enter is hit, try to indent to the right place
:set smartindent

" Highlight trailing whitespace
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/     

" Remove tailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Automatically StripTrailingWhitespace on save
"autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Remaps : to ;
nnoremap ; :

" Split window vertically with ss
map ss :vsplit<CR>
" Split horizontally with capital SS
map <S-s><S-s> :split<CR>

" Switch buffer with sd
map sd ,be

map <C-L> :call MoveRight()<CR>
map <C-J> :call MoveLeft()<CR>
map <C-I> :call MoveUp()<CR>
map <C-K> :call MoveDown()<CR>

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
"nnoremap <C-Q> :call CloseBuf()<C>
nmap <C-W> :bd<CR>
"map qq :call CloseBuf()<CR>
"map qq :bd<CR>

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

" Cycle color schemes with f4 and f5
let s:schemes = "\n".globpath(&rtp, "colors/*.vim")."\n"
let s:currentfile = ""
let s:currentname = ""

function! s:CycleColor(direction)
	if exists("g:colors_name") && g:colors_name != s:currentname
		" The user must have selected a colorscheme manually; try
		" to find it and choose the next one after it
		let nextfile = substitute(s:schemes, '.*\n\([^\x0A]*[/\\]'.g:colors_name.'\.vim\)\n.*', '\1', '')
		if nextfile == s:schemes
			let s:currentfile = ""
		else
			let s:currentfile = nextfile
		endif
	endif

	if a:direction >= 0
		" Find the current file name, and select the next one.
		" No substitution will take place if the current file is not
		"   found or is the last in the list.
		let nextfile = substitute(s:schemes, '.*\n'.s:currentfile.'\n\([^\x0A]\+\)\n.*', '\1', '')
		" If the above worked, there will be no control chars in
		"   nextfile, so this will not substitute; otherwise, this will
		"   choose the first file in the list.
		let nextfile = substitute(nextfile, '\n\+\([^\x0A]\+\)\n.*', '\1', '')
	else
		let nextfile = substitute(s:schemes, '.*\n\([^\x0A]\+\)\n'.s:currentfile.'\n.*', '\1', '')
		let nextfile = substitute(nextfile, '.*\n\([^\x0A]\+\)\n\+', '\1', '')
	endif

	if nextfile != s:schemes
		let clrschm = substitute(nextfile, '^.*[/\\]\([^/\\]\+\)\.vim$', '\1', '')
		" In case the color scheme does not set this variable, empty it so we can tell.
		unlet! g:colors_name
		exec 'colorscheme '.clrschm
		redraw
		if exists("g:colors_name")
			let s:currentname = g:colors_name
			if clrschm != g:colors_name
				" Let user know colorscheme did not set g:colors_name properly
				echomsg 'colorscheme' clrschm 'set g:colors_name to' g:colors_name
			endif
		else
			let s:currentname = ""
			echomsg 'colorscheme' clrschm 'did not set g:colors_name'
		endif
		echo s:currentname.' ('.nextfile.')'
	endif

	let s:currentfile = nextfile

endfunction

function! s:CycleColorRefresh()
	let s:schemes = "\n".globpath(&rtp, "colors/*.vim")."\n"
endfunction

command! CycleColorNext :call s:CycleColor(1)
command! CycleColorPrev :call s:CycleColor(-1)
command! CycleColorRefresh :call s:CycleColorRefresh()

nnoremap <f4> :CycleColorNext<cr>
nnoremap <f5> :CycleColorPrev<cr>
