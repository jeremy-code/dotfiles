/**
 * Unfortunately, the vast majority of these settings are not documented.
 * MozillaZine was set to read-only in 2019 and mozdev.org was shut down in
 * 2020.
 *
 * @see {@link https://searchfox.org/mozilla-release/source/modules/libpref/init/all.js }
 * @see {@link https://searchfox.org/mozilla-release/source/modules/libpref/init/StaticPrefList.yaml}
 * @see {@link https://searchfox.org/mozilla-release/source/browser/app/profile/firefox.js}
 * @see {@link https://developer.mozilla.org/en-US/docs/Mozilla/Firefox/Experimental_features}
 */

/**
 * Browser Settings
 */
user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.contentblocking.category", "standard");
user_pref("browser.download.autohideButton", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.protections_panel.infoMessage.seen", true);
user_pref("browser.startup.homepage", "about:blank");
user_pref("browser.urlbar.placeholderName.private", "Google");
user_pref("browser.urlbar.placeholderName", "Google");
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
user_pref("browser.warnOnQuitShortcut", false);

user_pref("devtools.browserconsole.filter.warn", false);
user_pref("devtools.cache.disabled", false);
user_pref("devtools.everOpened", true);

// "Dark" theme by Mozilla
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");

/**
 * Print Settings
 */
// Disable "Print headers and footers"
user_pref("print.print_footerleft", "");
user_pref("print.print_footerright", "");
user_pref("print.print_headerleft", "");
user_pref("print.print_headerright", "");

/**
 * Network Settings
 */
user_pref("network.trr.mode", 1);

// Whether we attempt to decode JXL images or not.
user_pref("image.jxl.enabled", true);

user_pref("sidebar.visibility", "hide-sidebar");

user_pref("view_source.wrap_long_lines", true);
