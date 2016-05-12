let mapleader = "\<Space>"
inoremap jk <esc>

execute pathogen#infect()
colorscheme badwolf 
syntax on
filetype plugin indent on

set nocompatible
set number
set nowrap
set showmode
set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set mouse=a
set history=1000
set clipboard=unnamedplus,autoselect
set completeopt=menuone,menu,longest
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest
set t_Co=256
set cmdheight=1
set laststatus=2

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'
let g:ctrlp_show_hidden = 1

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror

nmap <silent> <C-t> :NERDTreeToggle<CR>
nmap <silent> <F2> :NERDTreeFind<CR>

" leader mappings
nnoremap <Leader>w :w<CR>


" Added for Golang
nmap <F8> :TagbarToggle<CR>
