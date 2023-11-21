let mapleader=","
set nocompatible              " be iMproved, required
set updatetime=100
set number relativenumber
filetype on                  
filetype plugin on 
filetype indent on
syntax on

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes

" Utility
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
" Plug 'scrooloose/nerdtree-project-plugin'
" Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'liuchengxu/vim-which-key'

" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" To register the descriptions when using the on-demand load feature,
" use the autocmd hook to call which_key#register(), e.g., register for the Space key:
" autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

" LaTeX
Plug 'sirver/ultisnips'
Plug 'lervag/vimtex'
" Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'tpope/vim-dispatch'

" Programming Support
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround' 
Plug 'neoclide/coc.nvim'
Plug 'maxmellon/vim-jsx-pretty'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
colorscheme catppuccin


""""""""""""""""""""""""""""""
" Configuration Section
""""""""""""""""""""""""""""""

" Indent Line
let g:indentLine_setConceal=0

" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
nnoremap <leader>u <Cmd>call UltiSnips#RefreshSnippets()<CR>

" NERDTree config
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
"autocmd VimEnter * NERDTree | wincmd p

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

nnoremap <leader> :WhichKey ','<CR>
set timeoutlen=500

" Re-map normal movement
"nmap j gj
"nmap k gk
"vmap j gj
"vmap k gk

nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Window Navigation
nnoremap q <Cmd>q<CR>

" Buffer Navigation
nnoremap Q :bd!<CR>
nnoremap <Leader>b <Cmd>ls<CR>:b
nmap <C-b>j :bn!<CR>
nmap <C-b>k :bp!<CR>

" Tab Navigation
nnoremap <C-t>l <Cmd>tabn<CR>
nnoremap <C-t>n :tabs:tab<Space>
nnoremap <C-t>t <Cmd>tabnew<CR>
nnoremap <C-t>h <Cmd>tabp<CR>
nnoremap <C-t>k <Cmd>tabc<CR>

" NERDTree Mappings
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>nc :NERDTreeCWD<CR>

" Search
nnoremap <F9> :let @/ = ""<CR>

" Spell Check
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Git gutter mappings
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Misc.
nnoremap ; :
nmap <Leader>s <Cmd>write<CR>
nmap <Leader>r <Cmd>redraw!<CR>
