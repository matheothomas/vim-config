" matheo thomas vim configuration.

" Use 'z+o' and 'z+c' to open/close the folding paragraphs

" Color scheme configuration {{{
" https://github.com/lunacookies/vim-colors-xcode
" git clone https://github.com/arzg/vim-colors-xcode.git
" mkdir .vim
" cp -r vim-colors-xcode/{autoload,colors,doc} ~/.vim
 colorscheme xcodedark
" }}}


" General {{{

set nocompatible
set encoding=utf-8
set history=1000

syntax on
" Apply indentation of current line to the next one.
set autoindent
" Indents based on syntax/style of the code.
set smartindent
filetype plugin indent on
set shiftwidth=4
set tabstop=4

set number relativenumber
" Enable auto completion menu after pressing TAB.
set wildmenu
set wildmode=list:longest

set mouse=a
set scrolloff=5
set ttyfast

" set the backspace to delete normally
set backspace=indent,eol,start

" Allow movement between lines when going backwards at beginning of line
set whichwrap+=<,>,[,]

" }}}


" Search {{{
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
" }}}


" Display {{{
" set wrap
set showcmd
set showmode
let g:netrw_liststyle=3
let g:netrw_winsize=30
set splitright
set splitbelow
" }}}


" Folding paragraphs {{{
augroup filetype_vim
		autocmd!
		autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


" Status line {{{
" Clear status line when vimrc is reloaded.
set statusline=
" Status line left side.
set statusline +=\ %F\ %M\ %Y\ %R
" Use a divider to separate the left side from the right side.
set statusline+=%=
" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

" }}}


" Remapping {{{

" Reprogram window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Autocomplete (, ', ", [, { (disabled : replaced by plugin)
""ino " ""<left>
""ino ' ''<left>
""ino ( ()<left>
""ino [ []<left>
""ino { {}<left><cr><cr><up><del><left><cr>

" }}}


" Templates {{{

let authorName = " "
" Dynamically write file name and date.
fun WriteHeader()
	exe "1," . 5 . "g/name : /s/name : .*/name : " .
				\ expand('%')
	exe "1," . 5 . "g/author : /s/author : .*/author : " .
				\ g:authorName
	exe "1," . 5 . "g/date : /s/date : .*/date : " .
				\ strftime("%d-%m-%y")
endfun

" Use template corresponding to file type.
if has("autocmd")
	augroup templates
		autocmd BufNewFile *.c ks|0r ~/.vim/templates/template.c|call WriteHeader()|'s
		autocmd BufNewFile *.h ks|0r ~/.vim/templates/template.h|call WriteHeader()|'s
		autocmd BufNewFile *.scm ks|0r ~/.vim/templates/template.scm|call WriteHeader()|'s
	augroup END
endif

" }}}


" Plugins {{{

" Automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'frazrepo/vim-rainbow'
call plug#end()

" }}}


" Plugins settings {{{

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Vim Rainbow filetype specification
au FileType scheme call rainbow#load()
"let g:rainbow_active = 1

" Airline Theme
let g:airline_theme='tomorrow'
" }}}
