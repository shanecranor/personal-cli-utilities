#!/usr/bin/env bash
set -euo pipefail

# install repo git scripts into ~/gitscripts
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SOURCE_DIR="$REPO_ROOT/git-scripts"
DEST_DIR="$HOME/gitscripts"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "git-scripts directory not found at: $SOURCE_DIR"
  exit 1
fi

mkdir -p "$DEST_DIR"
cp -R "$SOURCE_DIR/." "$DEST_DIR/"

ZSHRC="$HOME/.zshrc"
PATH_LINE='export PATH="$HOME/gitscripts:$PATH"'
if [[ -f "$ZSHRC" ]]; then
  if ! grep -Fxq "$PATH_LINE" "$ZSHRC"; then
    {
      printf '\n# git scripts\n'
      printf '%s\n' "$PATH_LINE"
    } >> "$ZSHRC"
  fi
else
  printf '%s\n' "$PATH_LINE" > "$ZSHRC"
fi

echo "Installed git scripts to $DEST_DIR"
