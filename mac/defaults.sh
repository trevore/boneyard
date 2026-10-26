#!/bin/bash
# macOS settings. Safe to re-run. install.sh runs this.
set -euo pipefail

# Appearance and input. Dark mode and scroll direction apply after logging out and back in.
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

# Restart them so the Dock and Finder settings take effect now
killall Dock Finder 2>/dev/null || true
