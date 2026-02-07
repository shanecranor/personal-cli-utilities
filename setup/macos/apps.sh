brew install --cask google-chrome
brew install --cask firefox
brew install --cask visual-studio-code

# ask user before installing these apps
read -p "Do you want to install Slack? (y/n) " install_slack
if [[ $install_slack == "y" || $install_slack == "Y" ]]; then
  brew install --cask slack
fi

read -p "Do you want to install Discord? (y/n) " install_discord
if [[ $install_discord == "y" || $install_discord == "Y" ]]; then
  brew install --cask discord
fi

read -p "Do you want to install Spotify? (y/n) " install_spotify
if [[ $install_spotify == "y" || $install_spotify == "Y" ]]; then
  brew install --cask spotify
fi

read -p "Do you want to install Obsidian? (y/n) " install_obsidian
if [[ $install_obsidian == "y" || $install_obsidian == "Y" ]]; then
  brew install --cask obsidian
fi

read -p "Do you want to install the ChatGPT app? (y/n) " install_chatgpt
if [[ $install_chatgpt == "y" || $install_chatgpt == "Y" ]]; then
  brew install --cask chatgpt
fi

read -p "Do you want to install beekeeper studio? (y/n) " install_beekeeper
if [[ $install_beekeeper == "y" || $install_beekeeper == "Y" ]]; then
  brew install --cask beekeeper-studio
fi
