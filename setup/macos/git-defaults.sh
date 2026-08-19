#!/usr/bin/env bash
set -euo pipefail

# show the most recently committed branches first
git config --global branch.sort -committerdate

echo "Configured git branch listing to sort by most recent commit"

# Prune deleted remote branches whenever you fetch
git config --global fetch.prune true
echo "Configured git fetch to prune deleted remote branches"

# Also prune deleted remote tags
git config --global fetch.pruneTags true
echo "Configured git fetch to prune deleted remote tags"

# # When pushing a new branch, automatically set origin/<branch> as upstream
# git config --global push.autoSetupRemote true
# echo "Configured git push to automatically set upstream for new branches"