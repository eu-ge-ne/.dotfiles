# starship
eval "$(starship init zsh)"

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

# pnpm
export PNPM_HOME="/Users/eug/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/eug/.opam/opam-init/init.zsh' ]] || source '/Users/eug/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

# git
alias gitclean='git branch --merged origin/main | grep -vE "^\s*(\*|main)" | xargs -n 1 git branch -d'

# ps
alias psx="ps -o pid,%cpu,rss,command"
alias psw="watch ps -o pid,%cpu,rss,command"

