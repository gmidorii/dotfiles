set number
set title
set tabstop=2
set shiftwidth=4
set autoindent
set smartindent
set pumheight=10
set showmatch
set matchtime=1
set fenc=utf-8
set nobackup
set noswapfile
set virtualedit=onemore
set wildmode=list:longest
set background=dark
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
set autowrite

" key bind
"" window
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sw <C-w>w
"" tab
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT
nnoremap tr :<C-u>NERDTree<CR>

colorscheme hybrid
set t_Co=256

set laststatus=2

" LEADER
let mapleader = "\<Space>"
" go build
autocmd FileType go nmap <leader>b  <Plug>(go-build)
" go run
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" save file
nnoremap <Leader>w :w<CR>
" close file
nnoremap <Leader>q :wq<CR>

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

" python実行
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/midori/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/midori/.vim/dein')
  call dein#begin('/Users/midori/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/midori/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
	call dein#add('Shougo/neocomplete.vim')
	call dein#add('fatih/vim-go')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('scrooloose/nerdtree')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" 引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
if has('vim_starting') &&  file_name == ''
  autocmd VimEnter * NERDTree ./
endif

syntax on

let g:airline#extensions#tabline#enabled = 1

" tree shortcut
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" show dotfiles
let NERDTreeShowHidden=1

