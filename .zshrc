# dotfiles
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# eza
alias ls="eza -1lab --icons=always --group-directories-first"

# mise
eval "$(mise activate zsh)"

# pnpm
export PNPM_HOME="/Users/eug/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# starship
eval "$(starship init zsh)"

