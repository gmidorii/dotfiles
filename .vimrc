set number
set title
set tabstop=2
set shiftwidth=2
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
set completeopt=menuone
set mouse=a
"set ttymouse=xterm2
set undodir=$HOME/vim/undo

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
nnoremap sq :q<CR>
nnoremap tr :<C-u>NERDTree<CR>
"" git
nnoremap [fugitive]  <Nop>
nmap <space>g [fugitive]
nnoremap <silent> [fugitive]s :Gstatus<CR><C-w>T
nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]c :Gcommit-v<CR>
nnoremap <silent> [fugitive]d :Gdiff<CR>

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
" table mode toggle
nnoremap <Leader>tm :TableModeToggle<CR>

" vim-go
" highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
" 保存時にGoImports
let g:go_fmt_command = "goimports"
" gocode option(importされていない補完)
let g:go_gocode_unimported_packages = 1
" auto complete j,k move
let g:UltiSnipsExpandTrigger="<tab>"
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))


" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

" python実行
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
if &compatible
  set nocompatible               " Be iMproved
endif


"Start dein Scripts-------------------------

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
	" call dein#add('SirVer/ultisnips')
	call dein#add('fatih/vim-go')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('scrooloose/nerdtree')
	call dein#add('tpope/vim-fugitive')
	" python
	call dein#add('davidhalter/jedi-vim', {'of_ft': 'python'})

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

	" Markdown
  call dein#add('dhruvasagar/vim-table-mode')

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

colorscheme hybrid

" scrooloose/nerdtree
" 引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
if has('vim_starting') &&  file_name == ''
  autocmd VimEnter * NERDTree ./
endif
" tree shortcut
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" show dotfiles
let NERDTreeShowHidden=1

" unknown
syntax on
let g:airline#extensions#tabline#enabled = 1

" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" dhruvasagar/vim-table-mode
let g:table_mode_corner='|'

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

