
#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/mbadrala/dotfiles"

mkdir -p "$HOME/.config/home-manager"

mkdir -p "$HOME/.config"

ln -sf "$DOTFILES_DIR/.config/home-manager/home.nix" "$HOME/.config/home-manager/home.nix"

ln -sfn "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"

echo "Symlinks created!"
