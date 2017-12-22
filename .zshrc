############################
# SOURCE
############################
# 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
 tmux -2
fi
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
source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
# serverless
## tabtab source for serverless package
## uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/midori/.nodebrew/node/v0.12.7/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/midori/.nodebrew/node/v0.12.7/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
## tabtab source for sls package
## uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/midori/.nodebrew/node/v0.12.7/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/midori/.nodebrew/node/v0.12.7/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/soichiro-taga/y/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/soichiro-taga/y/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/soichiro-taga/y/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/soichiro-taga/y/google-cloud-sdk/completion.zsh.inc'; fi
# .zprofile
source ~/.zprofile
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
# git auto complete
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u


############################
# ZPLUG
############################
# Path to your oh-my-zsh installation.
export ZSH=$HOME/dotfiles
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# zplug
zplug "tcnksm/docker-alias", use:zshrc
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/brew",   from:oh-my-zsh
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "themes/kphoen", from:oh-my-zsh

# zplug install
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose


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
PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
### Golang
export GOPATH="$HOME/dev"
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"
# JAVA
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
GREP_OPTIONS="--color=always";export GREP_OPTIONS
export C_INCLUDE_PATH=/System/Library/Frameworks/Python.framework/Headers
## Python
eval "$(pyenv init -)"


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
# .zprofile
source ~/.zprofile
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
# direnv
eval "$(direnv hook zsh)"


############################
# ALIAS
############################
alias vi="nvim"
alias gs="git status"
alias gb-del="git branch --merged |egrep -v '\\*|develop|master'|xargs git branch -d"
alias gch="git checkout"
alias ll="ls -ltrG"
alias ls="ls -G"
alias gl="git log --decorate --oneline"
alias ssh='TERM=xterm ssh'
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'


############################
# HISTORY
############################
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
setopt share_history
setopt append_history
setopt hist_ignore_all_dups


