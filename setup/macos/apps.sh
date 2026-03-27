#!/usr/bin/env bash
set -euo pipefail

ensure_brew() {
  if command -v brew >/dev/null 2>&1; then
    return 0
  fi

  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required. Run setup/macos/install-dev.sh first."
    exit 1
  fi
}

confirm_install() {
  local label="$1"
  local cask="$2"
  local reply
  read -r -p "Do you want to install ${label}? (y/n) " reply
  if [[ "$reply" == "y" || "$reply" == "Y" ]]; then
    brew install --cask "$cask"
  fi
}

ensure_brew

brew install --cask google-chrome
# brew install --cask firefox
brew install --cask visual-studio-code

# cool calendar toolbar app
brew install --cask itsycal

# ask user before installing these apps
confirm_install "Slack" "slack"
# confirm_install "Discord" "discord"
# confirm_install "Spotify" "spotify"
# confirm_install "Obsidian" "obsidian"
# confirm_install "the ChatGPT app" "chatgpt"
# confirm_install "Beekeeper Studio" "beekeeper-studio"
# confirm_install "darktable" "darktable"
