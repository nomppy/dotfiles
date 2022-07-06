let mapleader=","
set nocompatible              " be iMproved, required
set updatetime=100
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

" Utility
Plugin 'easymotion/vim-easymotion'
Plugin 'preservim/nerdtree'
Plugin 'scrooloose/nerdtree-project-plugin'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'

" Programming Support
Plugin 'preservim/nerdcommenter'
Plugin 'neoclide/coc.nvim'
Plugin 'maxmellon/vim-jsx-pretty'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Aesthetics
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'arcticicestudio/nord-vim'
Plugin 'yggdroot/indentline'
call vundle#end()            " required

colorscheme nord

""""""""""""""""""""""""""""""
" Configuration Section
""""""""""""""""""""""""""""""

" NERDTree config
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
autocmd VimEnter * NERDTree | wincmd p

" Vim-Airline Configuration
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:indentLine_char='| '

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
filetype plugin indent on    " required
set autoindent
set smartindent
set smarttab

au BufNewFile, BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set textwidth=79 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix

set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab

" Better search
set hlsearch
set incsearch

" Spell Check
setlocal spell
set spelllang=en

set scrolloff=5 " Keep 5 lines above and below cursor

""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""

" Re-map normal movement
nmap j gj
nmap k gk
vmap j gj
vmap k gk

nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Window Navigation
nnoremap q :q<CR>

" Buffer Navigation
nnoremap Q :bd!<CR>
nnoremap <Leader>b :ls<CR>:b
nmap <C-b>j :bn!<CR>
nmap <C-b>k :bp!<CR>

" Tab Navigation
nnoremap <C-t>l :tabn<CR>
nnoremap <C-t>n :tabs:tab<Space>
nnoremap <C-t>t :tabnew<CR>
nnoremap <C-t>h :tabp<CR>
nnoremap <C-t>x :tabc<CR>

" NERDTree Mappings
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>nc :NERDTreeCWD<CR>

" Search
nnoremap <F3> :let @/ = ""<CR>

" Spell Check
inoremap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u 

" Git gutter mappings
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Misc.
nnoremap ; :
nmap <Leader>s :write<CR>
nmap <Leader>r :redraw!<CR>
