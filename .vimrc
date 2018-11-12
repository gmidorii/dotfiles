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
"set noswapfile
set directory=~/.vim/swap
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
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set clipboard+=unnamed
" macvim?
" set gfn=Monaco:h15


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
" go lint
autocmd FileType go nmap <leader>l  <Plug>(go-lint)
" go iferr
autocmd FileType go nmap <leader>e :GoIfErr<CR>
" go testfunc
autocmd FileType go nmap <leader>t :GoTestFunc<CR>
"autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow
" save file
nnoremap <Leader>w :w<CR>
" close file
nnoremap <Leader>q :x<CR>
" table mode toggle
nnoremap <Leader>tm :TableModeToggle<CR>
" Gina status
nnoremap <Leader>s :Gina status<CR>
" Gina commit
nnoremap <Leader>c :Gina commit<CR>
" Gina push
nnoremap <Leader>p :Gina push<CR>
" vim surround skip
let loaded_matchparen = 1


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
" snippet
let g:go_snippet_engine = "neosnippet"

" python実行
"autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
if &compatible
  set nocompatible               " Be iMproved
endif


"Start dein Scripts-------------------------

" Required:
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.vim/dein')
  call dein#begin('$HOME/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('Shougo/denite.nvim')
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('zchee/deoplete-go', {'build': 'make'})
	if !has('nvim')
 		call dein#add('roxma/nvim-yarp')
  	call dein#add('roxma/vim-hug-neovim-rpc')
  endif
	call dein#add('fatih/vim-go')
	" call dein#add('jodosha/vim-godebug')
	call dein#add('nsf/gocode')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('scrooloose/nerdtree')
	" python
	"call dein#add('davidhalter/jedi-vim', {'of_ft': 'python'})
  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
	" Markdown
  call dein#add('dhruvasagar/vim-table-mode')
	" Git
  call dein#add('lambdalisue/gina.vim')
	" ijaas
  call dein#add('$HOME/dev/src/github.com/google/ijaas/vim')
	" color

  call dein#add('hotwatermorning/auto-git-diff')

	" auto paste
	call dein#add('ConradIrwin/vim-bracketed-paste')

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
"colorscheme solarized

" scrooloose/nerdtree
" 引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
"if has('vim_starting') &&  file_name == ''
autocmd VimEnter * NERDTree ./
"endif
" tree shortcut
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" show dotfiles
let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 20

" unknown
"syntax on
let g:airline#extensions#tabline#enabled = 1

" deocomplete
let g:deoplete#enable_at_startup = 1

" dhruvasagar/vim-table-mode
let g:table_mode_corner='|'

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:python3_host_prog = expand('$HOME/.pyenv/shims/python3')

" Denite vim
noremap <C-P> :Denite buffer<CR>
noremap <C-N> :Denite file_rec<CR>

