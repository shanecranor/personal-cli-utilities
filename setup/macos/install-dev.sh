#!/usr/bin/env bash
set -euo pipefail
# tools I use to set up a new macOS machine
# prereqs: developer tools installed (triggered by running `git` command)
if ! git --version >/dev/null 2>&1; then
  echo "git not found. Install Xcode Command Line Tools by running: git"
  exit 1
fi
# Install Homebrew if not already installed
if ! command -v brew >/dev/null 2>&1; then
  read -r -p "Homebrew not found. Install Homebrew? (y/n) " install_brew
  if [[ $install_brew == "y" || $install_brew == "Y" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
fi

# ---- Javascript development tools ----
# install Volta
if ! command -v volta >/dev/null 2>&1; then
  read -r -p "Volta not found. Install Volta? (y/n) " install_volta
  if [[ $install_volta == "y" || $install_volta == "Y" ]]; then
    curl -fsSL https://get.volta.sh | bash
  fi
fi

# install Node
if command -v volta >/dev/null 2>&1; then
  volta install node@latest
else
  echo "Volta not installed. Skipping Node install."
fi

# ---- cli tools ----

# Install ohmyzsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  read -r -p "Oh My Zsh not found. Install Oh My Zsh? (y/n) " install_ohmyzsh
  if [[ $install_ohmyzsh == "y" || $install_ohmyzsh == "Y" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
fi
