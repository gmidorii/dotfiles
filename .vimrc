set number
set title
set tabstop=2
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

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

" python実行
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
