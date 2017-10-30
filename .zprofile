WP_TESTS_DIR="/Users/midori/documents/wp-test/tests/phpunit"
BP_TESTS_DIR="/Users/midori/documents/buddypress-test/tests/phpunit"

export WP_TESTS_DIR BP_TESTS_DIR

alias vi='vim'

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
