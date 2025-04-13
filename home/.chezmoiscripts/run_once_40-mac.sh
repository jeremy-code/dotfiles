#!/usr/bin/env zsh
#
# Inspired by Mathias Bynens's legendary `.macos` script
# https://mths.be/macos

sudo --validate # Authenticate the user and extends the sudo timeout for another 5 minutes

# Enable /usr/lib/pam/pam_tid.so.2 for Touch ID authentication in `sudo`
# https://github.com/apple-oss-distributions/pam_modules/blob/main/modules/pam_tid/pam_tid.c
sudo tee /etc/pam.d/sudo_local << EOF > /dev/null
# sudo_local: local config file which survives system update and is included for sudo

# enable Touch ID authentication for sudo
auth       sufficient     pam_tid.so
EOF

#######################################
# MARK: System Settings
# Updates System Settings ("/System/Applications/System Settings.app")
#######################################

# region

## Network (x-apple.systempreferences:com.apple.Network-Settings)
/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on    # Enable "Firewall"
/usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned on    # Enable "Automatically allow built-in software to receive incoming connections"
/usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp on # Enable "Automatically allow downloaded signed software to receive incoming connections"
/usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on    # "Enable stealth mode"

## General

### Storage (x-apple.systempreferences:com.apple.settings.Storage)
defaults write MobileMeAccounts iCloudHomeShouldEnable -bool false # Disable "iCloud Drive"

### Airdrop & Handoff (x-apple.systempreferences:com.apple.AirDrop-Handoff-Settings)
defaults write com.apple.sharingd DiscoverableMode -string "Contacts Only"

### Language & Region (x-apple.systempreferences:com.apple.Localization-Settings)
defaults write -g AppleLanguages -array "en-US" "en" # Preferred languages
defaults write -g AppleLocale -string "en_US@currency=usd"
defaults write -g AppleTemperatureUnit -string "Fahrenheit"
defaults write -g AppleMeasurementUnits -string "Inches" # Measurement system: US
defaults write -g AppleMetricUnits -bool false
defaults write -g AppleLiveTextEnabled -bool true # Enable Live Text (Select text in images to copy or take action)

### Time Machine (x-apple.systempreferences:com.apple.Time-Machine-Settings)

# Exclude ~/Github and `$XDG_CACHE_HOME` from Time Machine backups
sudo defaults write /Library/Preferences/com.apple.TimeMachine SkipPaths -array \
  "${HOME}/Github" \
  "${HOME}/.cache"

## Appearance (x-apple.systempreferences:com.apple.Appearance-Settings)
defaults write -g AppleInterfaceStyle -string "Dark"       # Dark mode
defaults write -g NSTableViewDefaultSizeMode -int 2        # Set "Sidebar icon size" to "Medium"
defaults write -g AppleReduceDesktopTinting -bool true     # Disable "Allow wallpaper tinting in windows"
defaults write -g AppleShowScrollBars -string "Automatic;" # Show scroll bars automatically based on mouse or trackpad
defaults write -g AppleScrollerPagingBehavior -bool true   # Click in the scroll bar to "Jump to the spot that's clicked"

## Apple Intelligence & Siri (x-apple.systempreferences:com.apple.Siri-Settings)
defaults write com.apple.CloudSubscriptionFeatures.optIn auto_opt_in -bool false # Disable "Apple Intelligence"
defaults write com.apple.assistant.support "Assistant Enabled" -bool false       # Disable "Siri"

## Control Center (x-apple.systempreferences:com.apple.ControlCenter-Settings)
defaults write com.apple.controlcenter "NSStatusItem Visible WiFi" -bool true
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true
defaults write com.apple.controlcenter "NSStatusItem Visible AirDrop" -bool true
defaults write com.apple.controlcenter "NSStatusItem Visible FocusModes" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible StageManager" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible ScreenMirroring" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible Display" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible NowPlaying" -bool false

defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -bool true # Show "Battery" in Menu Bar
defaults write com.apple.weather.menu "NSStatusItem Visible Item-0" -bool true   # Show "Weather" in Menu Bar

### Menu Bar Only
defaults write -g AppleMenuBarVisibleInFullscreen -bool false # Set "Automatically hide and show the menu bar" to "In Full Screen Only"
defaults write -g "_HIHideMenuBar" -bool false                # See above

## Accessibility (x-apple.systempreferences:com.apple.Accessibility)

### Display

defaults write com.apple.access showWindowTitlebarIcons -bool true # Enable "Show window title icons"

### Live Captions

defaults write com.apple.Accessibility FaceTimeCaptions -bool false # Disable "Live Captions in FaceTime"

### Pointer Control

# defaults write -g com.apple.mouse.doubleClickThreshold -float 1.7 -- Set in "Mouse"
defaults write -g com.apple.springing.enabled -bool true # Enable "Spring-loading"
defaults write -g com.apple.springing.delay -float 0     # Set "Spring-loading speed" to fastest (7/7)

## Desktop & Dock (x-apple.systempreferences:com.apple.Desktop-Settings)

### Dock

defaults write com.apple.dock tilesize -int 64
defaults write com.apple.dock largesize -int 16 # Set "Magnification" to Off

defaults write com.apple.dock mineffect -string "scale"          # Set "Minimize windows using" to "Scale Effect"
defaults write -g AppleActionOnDoubleClick -string "Maximize"    # Set "Double-click a window's title bar" to "Zoom"
defaults write com.apple.dock minimize-to-application -bool true # Enables "Minimize windows into application icon"

defaults write com.apple.dock autohide -bool false               # Disable "Automatically hide and show the Dock"
defaults write com.apple.dock launchanim -bool true              # Enable "Animate opening applications"
defaults write com.apple.dock show-process-indicators -bool true # Enable "Show indicators for open applications"
defaults write com.apple.dock show-recents -bool false           # Disable "Show suggested and recent apps in Dock"

### Desktop & Stage Manager

defaults write com.apple.WindowManager StandardHideDesktopIcons -bool false        # Enable "Show Items" for "Desktop"
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool true # Set "Click wallpaper to reveal desktop" to "Always"
defaults write com.apple.WindowManager GloballyEnabled -bool false                 # Disable "Stage Manager"

### Widgets

### Windows

defaults write com.apple.dock windowtabbing -string "always" # Prefer tabs when opening documents
defaults write -g NSCloseAlwaysConfirmsChanges -bool true    # Enable "Ask to keep changes when closing documents"
defaults write -g NSQuitAlwaysKeepsWindows -bool false       # Enable "Close windows when quitting an application"

defaults write com.apple.WindowManager EnableTilingByEdgeDrag -bool true        # Enable "Drag windows to screen edges to tile"
defaults write com.apple.WindowManager EnableTopTilingByEdgeDrag -bool true     # Enable "Drag windows to menu bar to fill screen"
defaults write com.apple.WindowManager EnableTilingOptionAccelerator -bool true # Enable "Hold ⌥ key while dragging windows to tile"
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false     # Disable "Tiled windows have margins"

### Stage Manager

defaults write com.apple.dock mru-spaces -bool true                          # Enable "Automatically rearrange Spaces based on most recent use"
defaults write -g AppleSpacesSwitchOnActivate -bool true                     # Enable "When switching to an application, switch to a Space with open windows for the application"
defaults write com.apple.dock expose-group-apps -bool true                   # Enable "Group windows by application"
defaults write com.apple.spaces spans-displays -bool false                   # Enable "Displays have separate Spaces"
defaults write com.apple.dock enterMissionControlByTopWindowDrag -bool false # Disable "Drag windows to top of screen to enter Mission Control"

## Spotlight (x-apple.systempreferences:com.apple.Spotlight-Settings)
defaults write com.apple.assistant.support "Search Queries Data Sharing Status" -int 2 # Disable "Help Apple Improve Search"

## Notifications (x-apple.systempreferences:com.apple.preference.notifications)
defaults write com.apple.ncprefs content_visibility -int 2 # Set "Show previews" to "When Unlocked"

## Sound (x-apple.systempreferences:com.apple.preference.sound)
sudo nvram StartupMute=%01 # Disable "Play sound on startup"

## Lock Screen (x-apple.systempreferences:com.apple.Lock-Screen-Settings)
sudo pmset -a proximitywake 1 autorestart 1 lidwake 1 # All
sudo pmset -b displaysleep 5 disksleep 5 sleep 10     # Battery
sudo pmset -c displaysleep 30 disksleep 30 sleep 60   # Charger (wall power)

## Privacy & Security (x-apple.systempreferences:com.apple.preference.security)

### Sensitive Content Warning
defaults write com.apple.communicationSafetySettings "analyticsEnabled" -bool false # Disable "Improve Sensitive Content Warning"

### Analytics & Improvements
defaults write /Library/Application\ Support/CrashReporter/DiagnosticMessagesHistory AutoSubmit -bool false # Disable "Share Mac Analytics"
defaults write com.apple.assistant.support "Siri Data Sharing Opt-In Status" -int 2                         # Disable "Improve Siri & Dictation"
defaults write com.apple.Accessibility AXSAudioDonationSiriImprovementEnabled -bool false                   # Disable "Improve Assistive Voice Features"

### Apple Advertising
defaults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false # Disable "Personalized Ads"

### Apple Intelligence Report
defaults write com.apple.AppleIntelligenceReport reportDuration -int 0 # Disable "Apple Intelligence Report"

### Security
sudo spctl --global-enable # Set "Allow applications from" to "App Store" if it is "Anywhere"

if [[ "$(spctl --test-devid-status)" == "devid disabled" ]]; then
  url='\e]8;;x-apple.systempreferences:com.apple.settings.PrivacySecurity\aSystem Settings > Privacy & Security\e]8;;\a'
  echo -e "The option 'Allow applications from' is currently set to 'App Store'. Please go to ${url} and update it to 'App Store and Known Developers'"
fi

## Users & Groups (x-apple.systempreferences:com.apple.Users-Groups-Settings)
sudo sysadminctl -guestAccount off # Disable "Allow guests to log in to this computer"

## Keyboard (x-apple.systempreferences:com.apple.Keyboard-Settings)

defaults write -g KeyRepeat -int 2                    # Set "Key repeat rate" to fastest
defaults write -g InitialKeyRepeat_Level_Saved -int 6 # Set "Delay until repeat" to shortest
defaults write com.apple.HIToolbox -int 1             # Set "Press 🌐︎ key to" to "Change Input Source"
defaults write -g AppleKeyboardUIMode -int 2          # Enable "Keyboard navigation"

### Text Input
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool true                     # Enable "Correct spelling automatically"
defaults write -g WebAutomaticSpellingCorrectionEnabled -bool true                    # See above
defaults write -g NSAutomaticInlinePredictionEnabled -bool true                       # Enable "Show inline predictions"
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false                    # Disable "Add period with double-space"
defaults write -g KB_SpellingLanguage -dict KB_SpellingLanguageIsAutomatic -bool true # Set "Spelling" to "Automatic by Language"
defaults write -g NSAutomaticDashSubstitutionEnabled -bool true                       # Enable "Use smart quotes and dashes"
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool true                      # See above

### Dictation
defaults write com.apple.assistant.support "Dictation Enabled" -bool false # Disable "Dictation"

## Mouse (x-apple.systempreferences:com.apple.Mouse-Settings)
defaults write -g com.apple.mouse.scaling -float 0.5              # Set "Tracking speed" to 3/10 slowest
defaults write -g com.apple.swipescrolldirection -int 1           # Enable "Natural scrolling"
defaults write -g com.apple.mouse.doubleClickThreshold -float 1.7 # Set "Double-click speed" to 5/11 slowest
defaults write -g com.apple.scrollwheel.scaling -float 0.3125     # Set "Scrolling speed" to 4/8 slowest
defaults write -g com.apple.mouse.linear -bool false              # Enable "Pointer acceleration"

## Trackpad (x-apple.systempreferences:com.apple.Trackpad-Settings)

### Point & Click

defaults write -g com.apple.trackpad.scaling -float 0.6875                                 # Set "Tracking speed" to 4/10 slowest
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 1                # Set "Click" to "Medium"
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 1               # See above
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 1                  # Disable "Quiet Click"
defaults write -g com.apple.trackpad.forceClick -bool true                                 # Enable "Force Click and haptic feedback"
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -bool false # Set "Look up & data detectors" to "Force Click with One Finger"
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -bool false  # Set "Secondary click" to "Click with Two Fingers"
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true             # See above
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool false                      # Disable "Tap to click"

### Scroll & Zoom

# Natural scrolling may be enabled in global domain `com.apple.swipescrolldirection`, but this maps to the same setting set in Mouse
# default write -g com.apple.swipescrolldirection -int 1                                                      # Enable "Natural scrolling" (for trackpad)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool true                     # Enable "Zoom in or out"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -bool true # Enable "Smart zoom"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool true                    # Enable "Rotate"

### More Gestures

defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3 # Enable "Notification Center"
defaults write com.apple.dock showMissionControlGestureEnabled -bool true                          # Set "Mission Control" to "Swipe Up with Three Fingers"
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -bool false
defaults write com.apple.dock enterMissionControlByTopWindowDrag -bool false # There is no point in this setting since it just enables tiling
defaults write com.apple.dock showAppExposeGestureEnabled -bool false        # Set "App Exposé" to "Off"
defaults write com.apple.dock showLaunchpadGestureEnabled -bool true         # Enable "Launchpad"
defaults write com.apple.dock showDesktopGestureEnabled -bool true           # Enable "Show Desktop"

## Printer & Scanners (x-apple.systempreferences:com.apple.Print-Scan-Settings)
defaults write org.cups.PrintingPrefs UseLastPrinter -bool true          # Set "Default printer" to "Last Printer Used"
defaults write org.cups.PrintingPrefs DefaultPaperID -string "na-letter" # Set "Default paper size" to "US Letter"

# endregion

#######################################
# MARK: Global
# Updates Global domain (NSGlobalDomain)
#######################################

## Expand save panel by default

# Enable spelling and text replacement in all applications
defaults write -g WebContinuousSpellCheckingEnabled -boolean true
defaults write -g WebAutomaticTextReplacementEnabled -bool true

defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

## Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

# Update tiling Keyboard Shortcuts for all applications to match Rectangle shortcuts
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

defaults write -g AppleFontSmoothing -int 1                     # Enable light subpixel font rendering on non-Apple LCDs
defaults write -g ApplePressAndHoldEnabled -bool false          # Disable press-and-hold for character accents menu and enable key repeat
defaults write -g NSDisableAutomaticTermination -bool true      # Disable automatic termination of inactive apps
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false # Save to disk and not iCloud by default
defaults write -g NSTextShowsControlCharacters -bool true       # Display ASCII control characters using caret notation in standard text views

#######################################
# MARK: Finder
# Device Management / Finder (https://developer.apple.com/documentation/devicemanagement/finder)
#######################################

# General
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder NewWindowTarget -string "PfDe" # Set "New Finder windows show" to "Desktop"
defaults write com.apple.finder FinderSpawnTab -bool true      # Enable "Open folders in tabs instead of new windows"

# Advanced
defaults write -g AppleShowAllExtensions -bool true                        # Enable "Show all filename extensions"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # Disable "Show warning before changing an extension"
defaults write com.apple.finder WarnOnEmptyTrash -bool false               # Disable "Show warning before emptying the Trash"
defaults write com.apple.finder FXRemoveOldTrashItems -bool false          # Disable "Remove items from the Trash after 30 days"
defaults write com.apple.finder _FXSortFoldersFirst -bool true             # Enable "Keep folders on top in windows when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true    # Enable "Keep folders on top on Desktop"
defaults write com.apple.finder FXDefaultSearchScope -string "SCev"        # Set "When performing a search" to "Search This Mac"

# View
defaults write com.apple.finder FXPreferredViewStyle -string "clmv" # View > as Columns
defaults write com.apple.finder FXArrangeGroupViewBy -string "name" # View > Sort By > Name
defaults write com.apple.finder ShowPathbar -bool true              # View > Show Path Bar
defaults write com.apple.finder ShowStatusBar -bool true            # View > Show Status Bar

chflags nohidden ~/Library                                   # Show the ~/Library folder
defaults write com.apple.finder AppleShowAllFiles -bool true # Show hidden files by default

# Avoid creating `.DS_Store` files on network or USB volumes
# https://support.apple.com/en-us/102064
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Expand File Info panes: “General”, “Open with”, “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  Metadata -bool false \
  Name -bool false \
  Comments -bool false \
  OpenWith -bool true \
  Preview -bool false \
  Privileges -bool true

#######################################
# MARK: TextEdit
#######################################

# TextEdit > Settings... > New Document

defaults write -app TextEdit RichText -bool false # Set "Format" to "Plain text"

defaults write -app TextEdit WidthInChars -int 80
defaults write -app TextEdit HeightInChars -int 40

defaults write -app TextEdit NSFixedPitchFont -string "SFPro-Regular" # Plain text font
defaults write -app TextEdit NSFixedPitchFontSize -int 12
defaults write -app TextEdit NSFont -string "SFPro-Regular" # Rich text font
defaults write -app TextEdit NSFontSize -int 12

defaults write -app TextEdit CheckGrammarWithSpelling -bool true # Enable "Check grammar with spelling"
defaults write -app TextEdit DataDetectors -bool true            # Enable "Data detectors"
defaults write -app TextEdit SmartQuotes -bool false             # Disable "Smart quotes"
defaults write -app TextEdit SmartLinks -bool true
defaults write -app TextEdit SmartSubstitutionsEnabledInRichTextOnly -bool false # Disable "Smart quotes and dashes in rich text documents only"

#######################################
# MARK: iTerm2
#######################################

# While most iTerm settings are stored in the JSON file for Dynamic Profiles,
# {@link file://./../../home/Library/Application%20Support/iTerm2/DynamicProfiles/profiles.json}
# some settings must be set in the iTerm2 `.plist` file. Furthermore, the
# `.plist` contains keys that would be impossible to sync such as `NoSync_*` or
# keys storing terminal history. After this command is run, the `.plist` file
# will be merged with the default settings when iTerm2 is launched.

# This is represented as an OpenStep p-list dictionary since XML is very verbose
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

#######################################
# Bartender 5
#######################################

# Bartender 5 stores the profile icon as a Base64 encoded TIFF image
UUID=$(uuidgen)
ICON=$(base64 --input "${HOME}/.local/share/chezmoi/assets/icon.tif")
PROFILE=$(
  plutil -insert icon -data "${ICON}" -o - -- "${HOME}/.local/share/chezmoi/assets/bartender.xml"
)
defaults write -app Bartender\ 5 ProfileSettings -dict "${UUID}" "${PROFILE}"
defaults write -app Bartender\ 5 LastKnownProfile -string "${UUID}"
defaults write -app Bartender\ 5 PersistLastKnownProfile -bool true
