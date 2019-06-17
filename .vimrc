set number
set title
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set pumheight=10
set showmatch
set matchtime=1
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set nobackup
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
set mouse=a
set undodir=$HOME/vim/undo
set list
set listchars=tab:>-,trail:-
set clipboard+=unnamed

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
" go doc
autocmd FileType go nmap <leader>d :GoDoc<CR>

"autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow
" go iferr
autocmd FileType go nmap <leader>e :GoIfErr<CR>
" go test
autocmd FileType go nmap <leader>t :GoTestFunc<CR>

" vue
autocmd FileType vue syntax sync fromstart

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
let g:go_fmt_command = "goimports"
" auto complete j,k move
let g:UltiSnipsExpandTrigger="<tab>"
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-j>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-k>"))
" snippet
let g:go_snippet_engine = "neosnippet"
" run/test split
let g:go_term_mode = 'split'
" godef off
let g:go_def_mapping_enabled = 1

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
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('scrooloose/nerdtree')
  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  " Markdown
  call dein#add('dhruvasagar/vim-table-mode')
  " Git
  call dein#add('lambdalisue/gina.vim')
  " color
  call dein#add('hotwatermorning/auto-git-diff')
  " auto paste
  call dein#add('ConradIrwin/vim-bracketed-paste')
  " fzf
  call dein#add('/usr/local/opt/fzf')
  call dein#add('junegunn/fzf.vim')

  " vim-go
  call dein#add('fatih/vim-go')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('buoto/gotests-vim')

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
" colorscheme stellarized

" scrooloose/nerdtree
"if has('vim_starting') &&  file_name == ''
autocmd VimEnter * NERDTree ./
"endif
" tree shortcut
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" show dotfiles
let NERDTreeShowHidden=1
" width
let g:NERDTreeWinSize = 20

" unknown
"syntax on
let g:airline#extensions#tabline#enabled = 1

" deocomplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" dhruvasagar/vim-table-mode
let g:table_mode_corner='|'

" neosnippet
imap <C-s>     <Plug>(neosnippet_expand_or_jump)
smap <C-s>     <Plug>(neosnippet_expand_or_jump)
xmap <C-s>     <Plug>(neosnippet_expand_target)

let g:python3_host_prog = expand('$HOME/.pyenv/shims/python3')

" fzf vim
noremap <C-P> :GFiles<CR>
noremap <C-N> :Buffers<CR>

" Clean unuse plug
" call map(dein#check_clean(), "delete(v:val, 'rf')")
