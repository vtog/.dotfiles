call plug#begin('~/.local/share/nvim/plugged')

Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/rakr/vim-one.git'
Plug 'https://github.com/tomasiser/vim-code-dark.git'
Plug 'https://github.com/dense-analysis/ale.git'

call plug#end()

let g:airline_theme = 'codedark'
let g:one_allow_italics = 1

syntax on
set mouse=
set nofoldenable
set nohls
set encoding=utf-8
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set copyindent
set nowrap
set pastetoggle=<F3>
set termguicolors
colorscheme codedark

