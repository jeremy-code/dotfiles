// Mozilla User Preferences

/**
 * Equivalents in about:config
 */

// General
user_pref("browser.warnOnQuitShortcut", false); // Disable "Ask before quitting with ⌘Q"
user_pref("browser.tabs.groups.smart.userEnabled", false); // Disable "Use AI to suggest tabs and a name for tab groups"
user_pref("browser.download.useDownloadDir", false); // Enable "Always ask you where to save files"
user_pref("general.smoothScroll", true); // Enable "Use smooth scrolling"
user_pref("intl.accept_languages", ["en-us", "en"].join()); // Choose your preferred language for displaying pages

// Home
user_pref("browser.newtabpage.activity-stream.showSponsored", false); // Disable "Support Firefox"
user_pref("browser.newtabpage.activity-stream.showSponsoredCheckboxes", false); // Disable "Sponsored shortcuts"
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false); // Disable "Sponsored stories"

// Search
user_pref("browser.urlbar.suggest.trending", false); // Disable "Show trending search suggestions"
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false); // Disable "Suggestions from sponsors"

// Privacy & Security
user_pref("privacy.globalprivacycontrol.enabled", true); // Enable "Tell websites not to sell or share my data
user_pref("privacy.globalprivacycontrol.was_ever_enabled", true);
user_pref("signon.rememberSignons", false); // Disable "Ask to save passwords"
user_pref("signon.management.page.breach-alerts.enabled", false); // Disable "Show alerts about passwords for breached websites"
user_pref("extensions.formautofill.creditCards.enabled", false); // Disable "Save and autofill payment info"
user_pref("datareporting.healthreport.uploadEnabled", false); // Disable "Send technical and interaction data to Mozilla"
user_pref("browser.preferences.experimental.hidden", true); // Disable "Install and run studies"
user_pref("datareporting.usage.uploadEnabled", false); // Disable "Send daily usage ping to Mozilla"

/**
 * Browser Settings
 */
user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.download.autohideButton", false);
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org"); // "Dark" theme by Mozilla
user_pref("image.jxl.enabled", true); // Whether we attempt to decode JXL images or not.
user_pref("sidebar.visibility", "hide-sidebar");
user_pref("view_source.wrap_long_lines", true);

/**
 * Devtools settings
 */
user_pref("devtools.everOpened", true);
user_pref("devtools.command-button-measure.enabled", true); // Enable "Measure a portion of the page"
user_pref("devtools.command-button-screenshot.enabled", true); // Enable "Take a screenshot of the entire page"
user_pref("devtools.theme", "auto");
user_pref("devtools.toolbox.host", "right"); // DevTools "Dock to Right"
user_pref("devtools.toolbox.splitconsole.open", true); // Show Split Console
user_pref("devtools.screenshot.audio.enabled", false); // Disable "Play camera shutter sound"
user_pref("devtools.webconsole.timestampMessages", true);

/**
 * URL bar settings
 */
user_pref("browser.urlbar.suggest.yelp", false); // Disable Yelp suggestions
user_pref("browser.urlbar.suggest.yelpRealtime", false); // Disable Yelp real-time suggestions
user_pref("browser.urlbar.trimURLs", false); // Disable "Clean-up URLs when showing them in the Address Bar"

/**
 * Print Settings
 */
user_pref("print.more-settings.open", true);
// Disable "Print headers and footers"
user_pref("print.print_footerleft", "");
user_pref("print.print_footerright", "");
user_pref("print.print_headerleft", "");
user_pref("print.print_headerright", "");
