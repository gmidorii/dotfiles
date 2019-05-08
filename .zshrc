
############################
# ZPLUG
############################
export ZSH=$HOME/dotfiles
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# zplug
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# zplug install
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

# spaceship-prompt
SPACESHIP_DIR_COLOR=035
SPACESHIP_KUBECONTEXT_COLOR=252

zplug load --verbose >/dev/null

############################
# EXPORT
############################
# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/sbin"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# grpc
export PATH="$PATH:$HOME/command/protoc/bin"
# pyenv
eval "$(pyenv init -)"
export PIPENV_VENV_IN_PROJECT=true
export PATH="$PATH:$HOME/.local/bin"
# rbenv
export PATH="$HOME/.rbenv/shims/:$PATH"
### Golang
export GOPATH=$HOME/dev
export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"
export GO111MODULE=on
#eval "$(goenv init -)"
# App Engine
export PATH="$PATH:$HOME/google-cloud-sdk/platform/google_appengine"
# Java
export JAVA_HOME=$(/usr/libexec/java_home)
## Python
eval "$(pyenv init -)"
export PIPENV_VENV_IN_PROJECT=true
### pipenv (https://github.com/pypa/pipenv/issues/187)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
## Postgres
export PATH="/Library/PostgreSQL/9.6/bin/:$PATH"
# Powerline
export PATH=~/.local/bin/:$PATH
# Node
export PATH="$PATH:$HOME/.nodebrew/node/v0.12.7/bin"
# GCP
export PATH="$PATH:$HOME/google-cloud-sdk/bin/"

############################
# SETTING
############################
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
# keybind
bindkey -e
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
# direnv
#eval "$(direnv hook zsh)"


############################
# ALIAS
############################
alias vi="vim"
alias nvi="nvim"
alias gs="git status"
alias gc="git commit"
alias gb-del="git branch --merged |egrep -v '\\*|develop|master'|xargs git branch -d"
alias gch="git checkout"
alias gss="git status -s"
alias ga="git add"
alias gp="git push"
alias gd="git diff"
alias ll="ls -ltrG"
alias ls="ls -G"
alias gl="git log --decorate --oneline"
alias ssh='TERM=xterm ssh'
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'
alias g='cd $(ghq root)/$(ghq list | peco)'
alias c='code $(ghq root)/$(ghq list | peco)'
alias remem='du -sx / &> /dev/null & sleep 25 && kill $!'
alias cat='bat'
alias tmux='tmux -f $HOME/.tmux.conf'
alias cz='cd $(z -l | cut -c12- | peco)'
if [[ -x `which colordiff` ]]; then
	alias diff='colordiff -u'
else
	alias diff='diff -u'
fi
alias vimr='open -a vimr'


############################
# HISTORY
############################
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=10000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=1000000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
setopt share_history
setopt append_history
setopt hist_ignore_all_dups

############################
# SOURCE
############################
# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME/google-cloud-sdk/path.zsh.inc ]; then
  source $HOME'/google-cloud-sdk/path.zsh.inc'
fi
# The next line enables shell command completion for gcloud.
if [ -f $HOME/google-cloud-sdk/completion.zsh.inc ]; then
  source $HOME'/google-cloud-sdk/completion.zsh.inc'
fi
# gvim
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
# kubectl
autoload -U colors; colors
# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/y/google-cloud-sdk/path.zsh.inc' ]; then source '$HOME/y/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '$HOME/y/google-cloud-sdk/completion.zsh.inc' ]; then source '$HOME/y/google-cloud-sdk/completion.zsh.inc'; fi
# .zprofile
source ~/.zprofile
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
 tmux -2
fi
