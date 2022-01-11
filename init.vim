" syntax hightlight
syntax on

set encoding=utf-8

set smartindent
set smartcase
set autoindent
set tabstop=4
set smarttab
set softtabstop=4
set shiftwidth=4
set expandtab

set nobackup
set noswapfile

set undodir=~/.vim/undodir
set undofile

set number
set relativenumber

" cursor always be in middel of screen
set scrolloff=5

" set extra line before the number for show errors
set signcolumn=yes

" vertical line hightlight at column 80
set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" Enable cursor line position tracking:
set cursorline

" can use mouse
set mouse=a

" no wrap lines
set nowrap

" use system clipboard
set clipboard=unnamed

" Makes search act like search in modern browsers
set incsearch

set updatetime=10


" vim-plug from 'https://github.com/junegunn/vim-plug'
call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'       " vim air line
Plug 'https://github.com/preservim/nerdtree'            " NERDTree
Plug 'https://github.com/tpope/vim-commentary'          " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color'              " CSS Color Preview
Plug 'https://github.com/terryma/vim-multiple-cursors'  " CTRL + N for multiple cursors
Plug 'https://github.com/ryanoasis/vim-devicons'		" Developer Icons

" color schemes
Plug 'https://github.com/morhetz/gruvbox'               " scheme gruvbox
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme


call plug#end()


" color scheme setting
set background=dark
colorscheme gruvbox
" colorscheme jellybeans

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" next two function work on delete extra unnecessary white space
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

"   airline configrautions
" let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1


" nerdtree config
" show hidden files
let NERDTreeShowHidden=1
