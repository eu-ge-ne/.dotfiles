alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

alias ls="eza -1lab --icons=always --group-directories-first"

eval "$(fnm env --use-on-cd --shell zsh)"

eval "$(starship init zsh)"


# pnpm
export PNPM_HOME="/Users/eug/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

