autoload -U compinit
compinit

function peco-src() {
	local src=$(ghq list --full-path | peco --query "$LBUFFER")
	if [ -n "$src" ]; then
		BUFFER="cd $src"
		zle accept-line
	fi
	zle -R -c
}
zle -N peco-src
bindkey '^]' peco-src

function custom-cmd() {
	local src=
}

# pecoでhistory検索
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# peco + kill
function pk() {
	PROCESS=$(ps aux | peco)
	PID=$(echo "$PROCESS" | awk '{print $2}')
	if [ -n "$PID" ]; then
		echo "kill $PID"
		kill -9 $PID
	fi
}
zle -N pk
