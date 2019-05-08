# User configuration
set PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin /usr/local/sbin $PATH

# config
set XDG_DATA_HOME $HOME/.config

# Golang
set -x GOPATH $HOME/dev
set PATH $HOME/dev/bin $PATH
set GO111MODULE on
set PATH /usr/local/go/bin $PATH

# VSCode Go Bin
set PATH $HOME/go/bin $PATH

# Python
eval (pyenv init - | source)
set PIPENV_VENV_IN_PROJECT true
set PATH $HOME/.local/bin $PATH

# Node
set PATH $HOME/.nodebrew/current/bin $PATH
# GCP
set PATH $HOME/google-cloud-sdk/bin/ $PATH
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/midori/google-cloud-sdk/path.fish.inc' ]; . '/Users/midori/google-cloud-sdk/path.fish.inc'; end

# Rush
set PATH $HOME/.cargo/bin $PATH

# GHQ
set GHQ_ROOT $HOME/dev/src

# 環境変数
set LANG ja_JP.UTF-8
#set LANG en_US.UTF-8
#set LC_ALL en_US.UTF-8

# PostgreSQL
set PATH /Library/PostgreSQL/9.6/bin/ $PATH

# C++
set PATH /usr/local/Cellar/qt/5.12.0/bin $PATH
