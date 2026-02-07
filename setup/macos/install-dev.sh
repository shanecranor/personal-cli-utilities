#!/bin/bash
# tools I use to set up a new macOS machine
# prereqs: developer tools installed (triggered by running `git` command)
git --version
# Install Homebrew if not already installed
which brew >/dev/null 2>&1 || (
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
)

# ---- Javascript development tools ----
# install Volta
curl https://get.volta.sh | bash

# install Node
volta install node@latest

# ---- cli tools ----

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
