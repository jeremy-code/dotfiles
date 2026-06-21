// Mozilla User Preferences

/**
 * Equivalents in about:config
 */

// Home and startup
user_pref("browser.startup.homepage", "chrome://browser/content/blanktab.html");
user_pref("browser.newtabpage.activity-stream.showSponsored", false); // Disable "Support Firefox"
user_pref("browser.newtabpage.activity-stream.showSponsoredCheckboxes", false); // Disable "Sponsored shortcuts"
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false); // Disable "Sponsored stories"
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", true); // Enable "Recent Activity"

// Search
user_pref("browser.urlbar.placeholderName", "Google"); // Set "Default search engine" to Google
user_pref("browser.urlbar.placeholderName.private", "Google"); // Set "Default search engine" to Google

// Privacy and Security
user_pref("browser.contentblocking.category", "standard"); // Set "Enhanced Tracking Protection" to Standard
user_pref("privacy.globalprivacycontrol.enabled", true); // Enable "Tell websites not to sell or share my data
user_pref("privacy.globalprivacycontrol.was_ever_enabled", true);

// Passwords and autofill
user_pref("signon.rememberSignons", false); // Disable "Ask to save passwords"
user_pref("extensions.formautofill.creditCards.enabled", false); // Disable "Save and autofill payment info"
user_pref("signon.management.page.breach-alerts.enabled", false); // Disable "Show alerts about passwords for breached websites"

// Downloads
user_pref("browser.download.useDownloadDir", false); // Enable "Ask where to save files before downloading"

// Tabs and browsing
user_pref("browser.warnOnQuitShortcut", false); // Disable "Ask before quitting with ⌘Q"

// Search
user_pref("browser.urlbar.suggest.trending", false); // Disable "Show trending search suggestions"
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false); // Disable "Suggestions from sponsors"

// Privacy & Security
user_pref("browser.preferences.experimental.hidden", true); // Disable "Install and run studies"

// Accessibility
user_pref("general.smoothScroll", true); // Enable "Use smooth scrolling"

// Languages
user_pref("intl.accept_languages", "en-us, en"); // Set "Website language"

// AI controls
user_pref("browser.ai.control.sidebarChatbot", "blocked"); // Set "Chatbot in sidebar" to Blocked
user_pref("browser.ml.chat.enabled", false);
user_pref("browser.ml.chat.page", false);

// Permissions and data
user_pref("datareporting.healthreport.uploadEnabled", false); // Disable "Send technical and interaction data to Mozilla"
user_pref("nimbus.rollouts.enabled", false); // Disable "Allow Firefox Developer Edition to improve features, performance, and stability between undates"
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
