#!/usr/bin/env bash
set -euo pipefail

# install zsh git functions into ~/gitscripts and source them from ~/.zshrc
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SOURCE_FILE="$REPO_ROOT/zsh-functions/git-functions.zsh"
DEST_DIR="$HOME/gitscripts"
DEST_FILE="$DEST_DIR/git-functions.zsh"

if [[ ! -f "$SOURCE_FILE" ]]; then
  echo "Git functions file not found at: $SOURCE_FILE"
  exit 1
fi

mkdir -p "$DEST_DIR"
cp "$SOURCE_FILE" "$DEST_FILE"

ZSHRC="$HOME/.zshrc"
SOURCE_LINE='source "$HOME/gitscripts/git-functions.zsh"'
if [[ -f "$ZSHRC" ]]; then
  if ! grep -Fxq "$SOURCE_LINE" "$ZSHRC"; then
    {
      printf '\n# git functions\n'
      printf '%s\n' "$SOURCE_LINE"
    } >> "$ZSHRC"
  fi
else
  printf '%s\n' "$SOURCE_LINE" > "$ZSHRC"
fi

echo "Installed zsh git functions to $DEST_FILE"
echo "Run 'brew install fzf' if fzf is not already installed"
