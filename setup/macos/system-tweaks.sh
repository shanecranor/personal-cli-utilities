#!/usr/bin/env bash
set -euo pipefail

# enable dock auto-hide
defaults write com.apple.dock autohide -bool true

# disable dock auto-hide animation
defaults write com.apple.dock "autohide-time-modifier" -float "0"

# disable dock show animation
defaults write com.apple.dock "autohide-delay" -float "0"

# make hidden app icons translucent in the dock
defaults write com.apple.dock showhidden -bool true

# group windows by application in mission control
# defaults write com.apple.dock "expose-group-apps" -bool "true"

# speed up mission control animation
defaults write com.apple.dock expose-animation-duration -float 0.1

#restart dock to apply changes
killall Dock >/dev/null 2>&1 || true

# disable window tiling animations (I also recommend setting keyboard shortcuts to ctrl + option + arrow keys for tiling windows)
defaults write com.apple.WindowManager DisableTilingAnimations -bool true
killall WindowManager

# show file extensions by default
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# show hidden files in finder
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"

# show path bar in finder
defaults write com.apple.finder "ShowPathbar" -bool "true"

# set finder default view to column view
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"

# DO NOT save to iCloud by default
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
# restart finder to apply changes
killall Finder >/dev/null 2>&1 || true

# use plain text mode by default in TextEdit
defaults write com.apple.TextEdit "RichText" -bool "false"

# disable smart quotes in TextEdit
defaults write com.apple.TextEdit "SmartQuotes" -bool "false"
killall TextEdit >/dev/null 2>&1 || true

# show battery percentage in menu bar
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true
killall ControlCenter >/dev/null 2>&1 || true