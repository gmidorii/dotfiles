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
"set completeopt=menuone
set mouse=a
"set ttymouse=xterm2
set undodir=$HOME/vim/undo
"set list
"set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set listchars=trail:-,extends:»,precedes:«,nbsp:%
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
nnoremap sq :x<CR>
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
" go iferr
autocmd FileType go nmap <leader>e :GoIfErr<CR>
" go testfunc
autocmd FileType go nmap <leader>t :GoTestFunc<CR>
" go fillstruct
autocmd FileType go nmap <leader>f :GoFillStruct<CR>
" go def split
autocmd FileType go nmap <leader>g <Plug>(go-def-split)

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
" Gina log
nnoremap <leader>l  :Gina log<CR>
" Gina push
nnoremap <Leader>n :<C-u>setlocal relativenumber!<CR>
" vim surround skip
let loaded_matchparen = 1


" vim-go
" highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
" 保存時にGoImports
let g:go_fmt_command = "goimports"
" gocode option(importされていない補完)
" let g:go_gocode_unimported_packages = 1
" auto complete j,k move
let g:UltiSnipsExpandTrigger="<tab>"
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-j>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-k>"))
" snippet
let g:go_snippet_engine = "neosnippet"
" run/test split
let g:go_term_mode = 'split'
" godef off
let g:go_def_mapping_enabled = 0

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

	" vim-lsp
	" call dein#add('prabirshrestha/async.vim')
	" call dein#add('prabirshrestha/vim-lsp')
	" async
	call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('prabirshrestha/asyncomplete.vim')
  call dein#add('prabirshrestha/asyncomplete-lsp.vim')

	" vim-go
	" call dein#add('Shougo/deoplete.nvim')
	"call dein#add('zchee/deoplete-go', {'build': 'make'})
	" if !has('nvim')
 	" 	call dein#add('roxma/nvim-yarp')
  " 	call dein#add('roxma/vim-hug-neovim-rpc')
  " endif
	call dein#add('fatih/vim-go')
	" call dein#add('jodosha/vim-godebug')
	" call dein#add('nsf/gocode')

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

"colorscheme hybrid
colorscheme stellarized

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
" let g:deoplete#enable_at_startup = 1

" dhruvasagar/vim-table-mode
let g:table_mode_corner='|'

" neosnippet
imap <C-s>     <Plug>(neosnippet_expand_or_jump)
smap <C-s>     <Plug>(neosnippet_expand_or_jump)
xmap <C-s>     <Plug>(neosnippet_expand_target)

let g:python3_host_prog = expand('$HOME/.pyenv/shims/python3')

" Denite vim
noremap <C-P> :Denite buffer<CR>
noremap <C-N> :Denite file_rec<CR>

" Go-LSP
"if executable('golsp')
"  augroup LspGo
"    au!
"    autocmd User lsp_setup call lsp#register_server({
"        \ 'name': 'go-lang',
"        \ 'cmd': {server_info->['golsp']},
"        \ 'whitelist': ['go'],
"        \ })
"    autocmd FileType go setlocal omnifunc=lsp#complete
"		autocmd FileType python,go nmap gd <plug>(lsp-definition)
"  augroup END
if executable('go-langserver')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'go-lang',
        \ 'cmd': {server_info->['go-langserver', '-mode', 'stdio', '-gocodecompletion']},
        \ 'whitelist': ['go'],
        \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
  augroup END
endif

let g:lsp_async_completion = 1
let g:lsp_log_verbose = 1

let g:asyncomplete_auto_popup = 1

" Clean unuse plug
call map(dein#check_clean(), "delete(v:val, 'rf')")
