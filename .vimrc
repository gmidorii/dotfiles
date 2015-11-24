set number
set title
set tabstop=4
set shiftwidth=4
set smartindent
set pumheight=10
set showmatch
set matchtime=1

set background=dark
colorscheme hybrid
syntax on
set t_Co=256

set laststatus=2

if has('vim_starting')
	" 初回起動時のみruntimepathにneobundleのパスを指定する
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするプラグインをここに記述
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
NeoBundle 'bronson/vim-trailing-whitespace'
if has('lua')
	NeoBundleLazy 'Shougo/neocomplete.vim', {
		\ 'depends' : 'Shougo/vimproc',
	    \ 'autoload' : { 'insert' : 1,}
	    \ }
endif

  " neocomplete {{{
  let g:neocomplete#enable_at_startup               = 1
  let g:neocomplete#auto_completion_start_length    = 3
  let g:neocomplete#enable_ignore_case              = 1
  let g:neocomplete#enable_smart_case               = 1
  " let g:neocomplete#enable_camel_case               = 1
  " let g:neocomplete#use_vimproc                     = 1
  " let g:neocomplete#sources#buffer#cache_limit_size = 1000000
  " let g:neocomplete#sources#tags#cache_limit_size   = 30000000
  let g:neocomplete#enable_fuzzy_completion         = 1
  let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
  " " }}}

call neobundle#end()

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

