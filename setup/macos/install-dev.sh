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
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
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

# install fzf
if command -v brew >/dev/null 2>&1; then
  if ! command -v fzf >/dev/null 2>&1; then
    brew install fzf
  fi
else
  echo "Homebrew not installed. Skipping fzf install."
fi

# Install ohmyzsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  read -r -p "Oh My Zsh not found. Install Oh My Zsh? (y/n) " install_ohmyzsh
  if [[ $install_ohmyzsh == "y" || $install_ohmyzsh == "Y" ]]; then
    # Prevent the installer from starting a new shell or changing the login shell mid-script.
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
fi

# Install powerlevel10k theme and set it as default
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
  P10K_DIR="$ZSH_CUSTOM_DIR/themes/powerlevel10k"
  if [[ ! -d "$P10K_DIR" ]]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
  fi

  ZSHRC="$HOME/.zshrc"
  THEME_LINE='ZSH_THEME="powerlevel10k/powerlevel10k"'
  if [[ -f "$ZSHRC" ]]; then
    if grep -q '^ZSH_THEME=' "$ZSHRC"; then
      # macOS BSD sed requires a backup suffix; use empty string to avoid backup files.
      sed -i '' "s|^ZSH_THEME=.*|$THEME_LINE|" "$ZSHRC"
    else
      {
        printf '\n# Theme\n'
        printf '%s\n' "$THEME_LINE"
      } >>"$ZSHRC"
    fi
  else
    printf '%s\n' "$THEME_LINE" >"$ZSHRC"
  fi
fi
