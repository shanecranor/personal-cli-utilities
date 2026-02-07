# enable dock auto-hide
defaults write com.apple.dock autohide -bool true

# disable dock auto-hide animation
defaults write com.apple.dock "autohide-time-modifier" -float "0"

# disable dock show animation
defaults write com.apple.dock "autohide-delay" -float "0"

# make hidden app icons translucent in the dock
defaults write com.apple.dock showhidden -bool true

# group windows by application in mission control
defaults write com.apple.dock "expose-group-apps" -bool "true"

# speed up mission control animation
defaults write com.apple.dock expose-animation-duration -float 0.1

#restart dock to apply changes
killall Dock

# show file extensions by default
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "false"

# show hidden files in finder
defaults write com.apple.finder "AppleShowAllFiles" -bool "false"

# show path bar in finder
defaults write com.apple.finder "ShowPathbar" -bool "true"

# set finder default view to column view
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"

# DO NOT save to iCloud by default
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
# restart finder to apply changes
killall Finder

# use plain text mode by default in TextEdit
defaults write com.apple.TextEdit "RichText" -bool "false"

# disable smart quotes in TextEdit
defaults write com.apple.TextEdit "SmartQuotes" -bool "false"
# restart TextEdit to apply changes
killall TextEdit
