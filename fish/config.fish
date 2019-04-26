if test $TERM != "screen"
 #tmux attach
end

source ~/dotfiles/fish/alias.fish
source ~/dotfiles/fish/path.fish

function fish_user_key_bindings
	bind \cr 'peco_select_history (commandline -b)'
	bind \c] peco_select_ghq_repository
end

