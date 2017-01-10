# Path to your oh-my-zsh installation.
 export ZSH=/Users/midori/.oh-my-zsh

ZSH_THEME="gallois"

plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
# export MANPATH="/usr/local/man:$MANPATH"

 source $ZSH/oh-my-zsh.sh


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# 環境変数
export LANG=ja_JP.UTF-8


# 色を使用出来るようにする
autoload -Uz colors
colors

# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# Editor=>Vim
export EDITOR=vim

# 補完候補を詰めて表示
setopt list_packed

## TAB で順に補完候補を切り替える
setopt auto_menu

## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1
