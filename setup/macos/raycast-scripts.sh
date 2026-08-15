#!/usr/bin/env bash
set -euo pipefail

# Install repo Raycast script commands into ~/raycast_scripts.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SOURCE_DIR="$REPO_ROOT/raycast-scripts"
DEST_DIR="$HOME/raycast_scripts"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "raycast-scripts directory not found at: $SOURCE_DIR"
  exit 1
fi

mkdir -p "$DEST_DIR"
cp -R "$SOURCE_DIR/." "$DEST_DIR/"

echo "Installed Raycast scripts to $DEST_DIR"
