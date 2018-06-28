# User configuration
set PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin /usr/local/sbin $PATH

# Golang
set GOROOT $HOME/.goenv/versions/1.9.1
set GOPATH $HOME/src/golang
set PATH $GOPATH/bin $PATH
#set PATH $HOME/.goenv/bin $PATH
eval (goenv init - | source)

# Python
eval (pyenv init - | source)
# Node
set PATH $HOME/.nodebrew/node/v0.12.7/bin $PATH
# GCP
set PATH $HOME/google-cloud-sdk/bin/ $PATH

# 環境変数
set LANG ja_JP.UTF-8
