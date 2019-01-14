# User configuration
set PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin /usr/local/sbin $PATH

# Golang
set -x GOPATH $HOME/src/golang
set PATH $GOPATH/bin $PATH
set GO111MODULE on

#set PATH $HOME/.goenv/bin $PATH
eval (goenv init - | source)

# Python
eval (pyenv init - | source)
# Node
set PATH $HOME/.nodebrew/current/bin $PATH
# GCP
set PATH $HOME/google-cloud-sdk/bin/ $PATH
# Rush
set PATH $HOME/.cargo/bin $PATH

# 環境変数
set LANG ja_JP.UTF-8
