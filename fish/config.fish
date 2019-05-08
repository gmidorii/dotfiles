if test $TERM != "screen"
 #tmux attach
 tmux
end

if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
    fish -c fisher
end

source ~/dotfiles/fish/alias.fish
source ~/dotfiles/fish/path.fish

function fish_user_key_bindings
	bind \cr 'peco_select_history (commandline -b)'
	bind \c] __ghq_crtl_g
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

