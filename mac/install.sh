#!/bin/bash
# Set up this Mac: packages, shell config, starship, vim.
# Safe to re-run. Existing files are moved aside (*.bak) before being replaced.
set -eu

DIR="$(cd "$(dirname "$0")" && pwd)"

if ! command -v brew >/dev/null; then
  echo "Install Homebrew first: https://brew.sh" >&2
  exit 1
fi

brew bundle --file="$DIR/Brewfile"

# Symlink $1 (file in this repo) to $2, backing up anything already there
link() {
  mkdir -p "$(dirname "$2")"
  if [ -e "$2" ] && [ ! -L "$2" ]; then
    mv "$2" "$2.bak"
    echo "backed up $2 -> $2.bak"
  fi
  ln -sfn "$1" "$2"
  echo "linked $2"
}

link "$DIR/starship.toml" ~/.config/starship.toml
link "$DIR/vimrc" ~/.vimrc
mkdir -p ~/.vim/backup ~/.vim/tmp

# Pull our zshrc into ~/.zshrc (once)
LINE="source $DIR/zshrc"
grep -qxF "$LINE" ~/.zshrc 2>/dev/null || echo "$LINE" >> ~/.zshrc

# vim-airline via Vim's built-in package loading
AIRLINE=~/.vim/pack/plugins/start/vim-airline
if [ -d "$AIRLINE" ]; then
  git -C "$AIRLINE" pull --quiet
else
  git clone --depth 1 https://github.com/vim-airline/vim-airline "$AIRLINE"
fi

cat <<'EOF'

Done. Two manual steps:
  1. iTerm2 -> Settings -> Profiles -> Text -> Font: JetBrainsMono Nerd Font
  2. Open a new terminal tab (or: source ~/.zshrc)
EOF
