" Set up vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here 
Plugin 'Shougo/vimproc.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/badwolf'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'
Plugin 'tfnico/vim-gradle'
Plugin 'vim-syntastic/syntastic'

Plugin 'Shougo/neocomplete.vim'
Plugin 'ervandew/supertab'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'enomsg/vim-haskellConcealPlus'
Plugin 'Twinside/vim-hoogle'
Plugin 'mpickering/hlint-refactor-vim'
Plugin 'neovimhaskell/haskell-vim'

Plugin 'ensime/ensime-vim'
Plugin 'derekwyatt/vim-scala'

Plugin 'vim-scripts/VimClojure'
Plugin 'tpope/vim-fireplace'

Plugin 'vim-airline/vim-airline'


" All of your Plugins must be added before the following line
call vundle#end()          
filetype plugin indent on 
" Vundle is now finished

let mapleader = "\<space>"
inoremap jk <esc>

colorscheme badwolf 
syntax on

noremap <Leader>s :update<CR>

set number
set nowrap
set showmode
set tw=120
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
set cmdheight=1
set laststatus=2
set completeopt=menuone,menu,longest

" Folding
set foldmethod=indent
set foldlevel=99

" Haskell

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>

map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

" if has("gui_running")
"   imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
" else " no gui
"   if has("unix")
"     inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
"   endif
" endif
" 
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Ctrl p

noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'
let g:ctrlp_show_hidden = 1


vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

" Nerd tree

nmap <silent> <C-t> :NERDTreeToggle<CR>
nmap <silent> <F2> :NERDTreeFind<CR>

" leader mappings
nnoremap <Leader>w :w<CR>

" Added for Golang
nmap <F8> :TagbarToggle<CR>

let g:go_fmt_command = "goimports"

" Custom for vim-go
au FileType go nmap <Leader>j <Plug>(go-def-pop)

" Defaults for vim-go
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>dd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>db <Plug>(go-def-pop)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Scala

:let maplocalleader = "\\"
autocmd BufWritePost *.scala silent :EnTypeCheck
nnoremap <localleader>t :EnTypeCheck<CR>
au FileType scala nnoremap <localleader>df :EnDeclaration<CR>
