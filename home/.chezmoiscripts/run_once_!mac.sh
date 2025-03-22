#!/usr/bin/env zsh

# Inspired by Mathias Bynens's legendary `.macos` script
# https://mths.be/macos

sudo -v # Authenticate the user and extends sudo timeout for 5 minutes

sudo nvram StartupMute=%01 # Mute sound effects on startup

# Power management settings

sudo pmset -a displaysleep 5 \
  proximitywake 1 \
  autorestart 1 \
  lidwake 1
sudo pmset -b sleep 10 # Battery
sudo pmset -c sleep 0 # Charger (wall power)

# Enable /usr/lib/pam/pam_tid.so.2 for Touch ID support in sudo
sudo tee /etc/pam.d/sudo_local << EOF > /dev/null
# sudo_local: local config file which survives system update and is included for sudo

# enable Touch ID for sudo
auth       sufficient     pam_tid.so
EOF

# Global domain (NSGlobalDomain)

## Set language and text formats
defaults write -g AppleLanguages -array "en"
defaults write -g AppleLocale -string "en_US@currency=USD"
defaults write -g AppleMeasurementUnits -string "Inches"
defaults write -g AppleMetricUnits -bool false

## Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

## Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

## Update tiling Keyboard Shortcuts for all applications to match Rectangle shortcuts
defaults write -g NSUserKeyEquivalents -dict-add \
  '\033Window\033Fill' '~^\U21A9' \
  '\033Window\033Center' '~^c' \
  '\033Window\033Move & Resize\033Left' '~^\UF702' \
  '\033Window\033Move & Resize\033Right' '~^\UF703' \
  '\033Window\033Move & Resize\033Top' '~^\UF700' \
  '\033Window\033Move & Resize\033Bottom' '~^\UF701' \
  '\033Window\033Move & Resize\033Bottom Left' '~^j' \
  '\033Window\033Move & Resize\033Bottom Right' '~^k' \
  '\033Window\033Move & Resize\033Top Left' '~^u' \
  '\033Window\033Move & Resize\033Top Right' '~^i' \
  '\033Window\033Move & Resize\033Return to Previous Size' '~^\U008'

defaults write -g AppleFontSmoothing -int 1 # Enable light subpixel font rendering on non-Apple LCDs
defaults write -g AppleKeyboardUIMode -int 3 # Enable full keyboard access for all controls
defaults write -g ApplePressAndHoldEnabled -bool false # Disable press-and-hold for character accents menu and enable key repeat
defaults write -g AppleShowAllExtensions -bool true # Show all filename extensions
defaults write -g NSDisableAutomaticTermination -bool true # Disable automatic termination of inactive apps
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false # Save to disk and not iCloud by default
defaults write -g NSTextShowsControlCharacters -bool true # Display ASCII control characters using caret notation in standard text views

# Finder

## Device Management / Finder (https://developer.apple.com/documentation/devicemanagement/finder)
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false # If false, the system doesn’t warn the user before emptying the trash

chflags nohidden ~/Library # Show the ~/Library folder

defaults write com.apple.finder AppleShowAllFiles true # Show hidden files by default
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # Disable warning when changing file extension
defaults write com.apple.finder FXPreferredViewStyle -string "clmv" # Column view
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

## Sort folders first when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true

## Enable spring loading for directories
defaults write -g com.apple.springing.enabled -bool true
defaults write -g com.apple.springing.delay -float 0

## Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

## Expand File Info panes: “General”, “Open with”, “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Dock (https://developer.apple.com/documentation/devicemanagement/dock)
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true # Enables "Minimize windows into application icon."
defaults write com.apple.dock tilesize -int 64

# Time Machine
sudo defaults write /Library/Preferences/com.apple.TimeMachine SkipPaths -array ~/Github

# iTerm2

# Some iTerm2 settings must be in a Plist and cannot be set by Dynamic Profiles
# {@link file://./../../home/Library/Application%20Support/iTerm2/DynamicProfiles/profiles.json}
# . Furthermore, the `.plist` contains keys that would be impossible to sync
# such as `NoSync_*` or history keys. This script sets some configuration
# options and when iTerm2 is launched, it merges them with the default options.

# This is represented as an "OpenStep" dictionary since XML is very verbose
defaults write -app iTerm '{
  /* General */
  PromptOnQuit = 0; // Confirm "Quit iTerm2 (⌘Q)"
  OnlyWhenMoreTabs = 0; // Confirm closing multiple sessions
  SavePasteHistory = 1; // Save copy/paste and command history to disk
  EnableAPIServer = 1; // Enable Python API
  NotifyOnlyForCriticalShellIntegrationUpdates = 0;
  SUEnableAutomaticChecks = 0; // Check for updates automatically
  DoubleClickPerformsSmartSelection = 1;
  ClickToSelectCommand = 0; // Clicking on a command selects it to restrict Find and Filter

  /* Appearance */
  TabStyleWithAutomaticOption = 5; // Minimal Theme
  WindowNumber = 0; // Show window number in title bar
  HideTab = 0; // Show tab bar even when there is only one tab

  /* Keys */
  ForceKeyboard = 1; // This will force iTerm2 to use the specified keyboard locale instead of the system keyboard
  KeyboardLocale = "com.apple.keylayout.US";

  /* Pointer */
  ThreeFingerEmulates = 1; // Three-finger tap emulates middle click

  /* Advanced */
  AlternateMouseScroll = 1; // Scroll wheel sends arrow keys when in alternate screen mode.
  SetCookie = 1; // Set ITERM2_COOKIE environment variable, allowing Python scripts to be launched without confirmation?
  PreventEscapeSequenceFromClearingHistory = 0; // Prevent CSI 3 J from clearing scrollback history?
  NoSyncDoNotWarnBeforeMultilinePaste = 1; // Suppress warning about multi-line pastes (or a single line ending in a newline).
}'

# Bartender 5 stores the profile icon as a Base64-encoded TIFF image
UUID=$(uuidgen)
PROFILE=$(plutil -insert icon -data "$(base64 --input ./../../assets/icon.tif)" -o - -- ./../../assets/bartender.xml)
defaults write -app Bartender\ 5 ProfileSettings -dict "$UUID" "$PROFILE"
defaults write -app Bartender\ 5 LastKnownProfile -string "$UUID"
defaults write -app Bartender\ 5 PersistLastKnownProfile -bool true
