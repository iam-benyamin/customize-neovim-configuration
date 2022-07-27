" syntax hightlight
syntax on
syntax enable

" can config neovim by file type
filetype plugin on
filetype on

" automaticly save files
set autowrite

set encoding=UTF-8

" tabs and indentation
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

" set extra line before the number for show errors
set signcolumn=yes

" vertical line hightlight at column 80
set colorcolumn=79
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" Enable cursor line position tracking:
set cursorline

" cursor always be in middel of screen
set scrolloff=5

" can use mouse
set mouse=a

" no wrap lines
set nowrap

" use system clipboard
set clipboard=unnamed

" Makes search act like search in modern browsers
set incsearch
" uper or lower case is important in searches
set ignorecase

" Give more space for displaying messages.
set cmdheight=1

" Enable folding
set foldmethod=indent
set foldlevel=99

set history=10

" vim-plug from 'https://github.com/junegunn/vim-plug'
call plug#begin()

Plug 'vim-airline/vim-airline'       " vim air line
Plug 'preservim/nerdtree'            " NERDTree
Plug 'tpope/vim-commentary'          " For Commenting gcc & gc
Plug 'ap/vim-css-color'              " CSS Color Preview
Plug 'terryma/vim-multiple-cursors'  " CTRL + N for multiple cursors
Plug 'ryanoasis/vim-devicons'		 " Developer Icons

" color schemes
Plug 'morhetz/gruvbox'                                  " gruvbox
Plug 'rafi/awesome-vim-colorschemes'                    " Retro
Plug 'joshdick/onedark.vim'                             " onedark

" repo url is 'https://github.com/neoclide/coc.nvim'
" google 'coc' for install autocomplition for your programming language
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " coc autocomplition for vim


" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

" javascript
Plug 'neovim/nvim-lspconfig'

" XML
Plug 'sukima/xmledit'

" git
Plug 'tpope/vim-fugitive'

" jsx Syntax Highlighting
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" typescript
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsxPlug'

Plug '907th/vim-auto-save'

" git
Plug 'airblade/vim-gitgutter'
call plug#end()

" color scheme setting
colorscheme gruvbox
set background=dark
" colorscheme afterglow


" colorscheme onedark
" transparent background
hi Normal guibg=NONE ctermbg=NONE

" if you wont to use onedark theme un comment next to lines
" next line you have to enter your theme config path
" source $HOME/.config/nvim/themes/onedark.vim

" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

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

" fzf pop up window
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.8 } }
" let $FZF_DEFAULT_OPTS='--reverse'

"   airline configrautions
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

" nerdtree config
" show hidden files
let NERDTreeShowHidden=1

" this line do auto complite with tab and use coc for this perpose
" this 10th installed plugin
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" coc set file type config for scss from coc-css extention
autocmd FileType scss setl iskeyword+=@-@


" ale configrautions
let g:ale_linters = {
            \ 'javascript': ['eslint'],
            \ }

let g:ale_fixers = {
            \ 'javascript': ['prettier', 'eslint']
            \ }

let g:ale_fix_on_save = 1
nmap <leader>d <Plug>(ale_fix)


" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

let g:gitgutter_override_sign_column_highlight = 1
" highlight SignColumn guibg=bg
" highlight SignColumn ctermbg=bg

" Update sign column every quarter second
set updatetime=250


" auto save
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
