#!/bin/bash
# macOS settings. Safe to re-run. install.sh runs this.
# Nothing is restarted, so the settings take effect after logging out and back in.
set -euo pipefail

# Appearance and input
defaults write NSGlobalDomain AppleInterfaceStyle -string Dark
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false  # natural scrolling off

# Dock: hide automatically, on the right, keep Spaces in the order I put them
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string right
defaults write com.apple.dock mru-spaces -bool false
# Bottom-right hot corner off (1 = no action; the default is Quick Note)
defaults write com.apple.dock wvous-br-corner -int 1
defaults write com.apple.dock wvous-br-modifier -int 0

# Finder: path and status bars, list view, new windows open home
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv
defaults write com.apple.finder NewWindowTarget -string PfHm
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/"
