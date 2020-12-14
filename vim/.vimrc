let mapleader=","
set nocompatible              " be iMproved, required
set number relativenumber
filetype off                  " required
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'arcticicestudio/nord-vim'

Plugin 'easymotion/vim-easymotion'

Plugin 'preservim/nerdtree'
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
map <Leader>n :NERDTreeToggle<CR>

" fuzzy search thing
Plugin 'preservim/nerdcommenter'

" AIRLINE 
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"let g:airline_theme='arcticicestudio/nord'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

Plugin 'yggdroot/indentline'
let g:indentLine_char='| '

Plugin 'junegunn/goyo.vim'
nnoremap <Leader>g :Goyo<CR>

Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

Plugin 'honza/vim-snippets'

Plugin 'neoclide/coc.nvim'
Plugin 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='mupdf'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" All of your Plugins must be added before the following line
call vundle#end()            " required
colorscheme nord

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" No swap

set noswapfile
set nobackup
set nowb

" Persistent Undo
" Keep undo history across sessions by storing in file
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" indentation
set autoindent
set smartindent
set smarttab
set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Better search
set hlsearch
set incsearch

" spellcheck
setlocal spell
set spelllang=en
inoremap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u 

set scrolloff=5 " Keep 5 lines above and below cursor

" move normally between wrapped lines
nmap j gj
nmap k gk
vmap j gj
vmap k gk

nnoremap H ^
nnoremap L $

nnoremap ; :

nmap <Leader>s :write<CR>
nmap <Leader>r :redraw!<CR>
