#!/usr/bin/env zsh

# Inspired by Mathias Bynens's legendary `.macos` script
# https://mths.be/macos

killall "System Settings"
sudo -v # Ask for the administrator password upfront

sudo nvram StartupMute=%01 # Mute sound effects on startup

# Remove duplicates in the “Open With” menu
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Set power management settings
sudo pmset -a displaysleep 5 \
  proximitywake 1 \
  autorestart 1 \
  lidwake 1
sudo pmset -b sleep 10 # Battery
sudo pmset -c sleep 0 # Power adapter

# Global Domain

# Enable subpixel font rendering on non-Apple LCDs
# https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

## Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

## Set language and text formats
defaults write NSGlobalDomain AppleLanguages -array "en"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Inches"
defaults write NSGlobalDomain AppleMetricUnits -bool false

## Disable press-and-hold and enable key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

## Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

## Save to disk and not iCloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

## Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

## Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Display ASCII control characters using caret notation in standard text views
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Finder

chflags nohidden ~/Library # Show the ~/Library folder

## Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles true

## Show all filename extensions and disable the warning when changing it
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

## Show icons for hard drives and servers on the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

## Show path bar and status bar
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

## Sort folders first when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true

## Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0

## Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv" # Column view
defaults write com.apple.finder WarnOnEmptyTrash -bool false

## Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

## Expand the following File Info panes:
## “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Dock

## Set the icon size of Dock items to 64 pixels
defaults write com.apple.dock tilesize -int 64
defaults write com.apple.dock minimize-to-application -bool true

## Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# TextEdit

## Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

## Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Misc. Apple applications

## Automatically quit `Printer Center.app` once print jobs are completed
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

## Disable “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
defaults write com.apple.commerce AutoUpdate -bool true

# iTerm2

defaults write com.googlecode.iterm2.plist '{
  "DoubleClickPerformsSmartSelection" = 1;
  "EnableAPIServer" = 1;
  "ForceKeyboard" = 1;
  "HideTab" = 0;
  "KeyboardLocale" = "com.apple.keylayout.US";
  "NoSyncDoNotWarnBeforeMultilinePaste" = 1;
  "NoSyncDoNotWarnBeforeMultilinePaste_selection" = 0;
  "NotifyOnlyForCriticalShellIntegrationUpdates" = 1;
  "OnlyWhenMoreTabs" = 0;
  "PreventEscapeSequenceFromClearingHistory" = 0;
  "PromptOnQuit" = 0;
  "SavePasteHistory" = 1;
  "SetCookie" = 1;
  "SUEnableAutomaticChecks" = 1;
  "TabStyleWithAutomaticOption" = 5;
  "ThreeFingerEmulates" = 1;
  "WindowNumber" = 0;
}'

echo "Done. Note that some of these changes require a logout/restart to take effect."
