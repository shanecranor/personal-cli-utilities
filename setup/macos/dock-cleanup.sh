#!/usr/bin/env bash
set -euo pipefail

# remove stupid default apps from the dock
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/util/dock-functions.sh"

declare -a apps=(
  '/System/Applications/Utilities/Terminal.app'
  '/System/Applications/Utilities/Activity Monitor.app'
  '/Applications/Spotify.app'
  '/Applications/Slack.app'
  '/Applications/Discord.app'
  '/Applications/Visual Studio Code.app'
  '/Applications/Firefox.app'
  '/Applications/Google Chrome.app'
  '/System/Applications/System Preferences.app'
)

# declare -a folders=(
#   ~/Downloads
# )

clear_dock
# disable_recent_apps_from_dock

for app in "${apps[@]}"; do
  add_app_to_dock "$app"
done

# for folder in "${folders[@]}"; do
#   add_folder_to_dock $folder
# done

killall Dock
