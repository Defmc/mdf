~/scripts/min_rxfetch.sh

source "$HOME/scripts/autorun/env.sh" "$HOME/scripts/autorun/prog" "$HOME/scripts/autorun/aliases.sh"


# pnpm
export PNPM_HOME="/home/me/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
