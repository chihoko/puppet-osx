# OSX Defaults Module for Puppet

[![Build Status](https://travis-ci.org/boxen/puppet-osx.png?branch=master)](https://travis-ci.org/boxen/puppet-osx)

Provides classes for setting various defaults in Mac OS X. Also provides a means
to set a "recovery message" to be displayed on the login and lock screens.

## Recovery Message Usage

Displays the given message on the lock and login screens.

```puppet
osx::recovery_message { 'If this Mac is found, please call 123-456-7890': }
```

## One-Shot Settings

Just `include` any of these in your manifest.

### Dock Settings

`osx::dock::clear` - ensures the dock only contains apps that are running

```puppet
include osx::dock::clear
```

`osx::dock::autohide` - automatically hide the dock

```puppet
class { 'osx::dock::autohide':
  enabled => true,
  delay   => 0,
}
```

`osx::dock::hidden_app_dimming` - dims icons of hidden apps

```puppet
class { 'osx::dock::hidden_app_dimming':
  enabled => true
}
```

`osx::dock::icon_bounce` - toggle bouncing application icon on launch or on activity

```puppet
class { 'osx::dock::icon_bounce':
  on_app_launch => true,
  on_app_activity => true,
}
```

`osx::dock::icon_size` - set size of icons in dock in pixels

```puppet
class { 'osx::dock::icon_size':
  size => 36
}
```

`osx::dock::indicator_lights` - toggle the indicator lights below running applications

```puppet
class { 'osx::dock::indicator_lights':
  enabled => false
}
```

`osx::dock::itunes_notifications` - toggle the indicator lights below running applications

```puppet
class { 'osx::dock::itunes_notifications':
  enabled => false
}
```

`osx::dock::magnification` - toggles magnification of icons and sets icon magnification size

```puppet
class { 'osx::dock::magnification':
  enabled => true,
  magnified_icon_size => 48,
}
```

`osx::dock::only_show_running_apps` - only show running applications in the dock

```puppet
class { 'osx::dock::only_show_running_apps':
  enabled => true
}
```

`osx::dock::orientation` - set the position of the dock relative to the desktop to on of the following values:

* 'top'
* 'bottom'
* 'right'
* 'left'

```puppet
class { 'osx::dock::orientation':
  orientation => 'left'
}
```

`osx::dock::style` - set the style of the dock to 2D or 3D

```puppet
class { 'osx::dock::style':
  style => '2D'
}
```

### Energy Settings

`osx::energy::disk_sleep` - set time until disk sleep on battery and plugged in

```puppet
class { 'osx::energy::disk_sleep':
  on_battery => 100,
  when_plugged_in => 100,
}
```

`osx::energy::display_sleep` - set time until display sleep on battery and plugged in

```puppet
class { 'osx::energy::display_sleep':
  on_battery => 100,
  when_plugged_in => 100,
}
```

`osx::energy::hibernation` - set time until hibernation on battery and plugged in

```puppet
class { 'osx::energy::hibernation':
  on_battery => 100,
  when_plugged_in => 100,
}
```

`osx::energy::sleep` - set time until sleep on battery and plugged in

```puppet
class { 'osx::energy::sleep':
  on_battery => 100,
  when_plugged_in => 100,
}
```

### Finder Settings

`osx::finder::unhide_library` - unsets the hidden flag on ~/Library

`osx::finder::allow_quit` - allow quit finder

```puppet
class { 'osx::finder::allow_quit':
  enabled => true
}
```

`osx::finder::animations` - enable finder animations

```puppet
class { 'osx::finder::animations':
  enabled => false
}
```

`osx::finder::date_format` - set finder date format to 'relative' or 'absolute'

```puppet
class { 'osx::finder::date_format':
  format => 'relative'
}
```

`osx::finder::default_file_view_mode` - set finder default file view mode to one of the following:

* list

Not yet implemented:

* icon
* column
* cover flow

```puppet
class { 'osx::finder::default_file_view_mode':
  mode => 'list'
}
```

`osx::finder::default_location` - set finder default view location to one of the following:

* 'home directory'

```puppet
class { 'osx::finder::default_location':
  location => 'home directory'
}
```

`osx::finder::default_search_scope` - set finder default scope when using the search box in finder to one of the following:

* 'home directory'

```puppet
class { 'osx::finder::default_search_scope':
  scope => 'current folder'
}
```

`osx::finder::file_extensions` - set finder to display all file extensions and warn when changing the file extension

```puppet
class { 'osx::finder::file_extensions':
  display_all => true,
  warn_on_change => false,
}
```

`osx::finder::icon_arrangement` - set finder icon arrangement

```puppet
class { 'osx::finder::icon_arrangement':
  style => 'name'
}
```

`osx::finder::icon_previews` - enable icon previews in finder

```puppet
class { 'osx::finder::icon_previews':
  enabled => false
}
```

`osx::finder::path_bar` - enable path bar in finder

```puppet
class { 'osx::finder::path_bar':
  enabled => false
}
```

`osx::finder::posix_title_path` - enable full POSIX path in finder title bar

```puppet
class { 'osx::finder::posix_title_path':
  enabled => true
}
```

`osx::finder::quicklook_text_selection` - enable text selection in QuickLook Window

```puppet
class { 'osx::finder::quicklook_text_selection':
  enabled => true
}
```

`osx::finder::springing` - enable springing and set spring delay

```puppet
class { 'osx::finder::springing':
  enabled => true,
  delay => 0,
}
```

`osx::finder::status_bar` - display status bar in finder

```puppet
class { 'osx::finder::status_bar':
  enabled => true,
}
```

### Firewall

`osx::firewall::auto_allow_signed_applications` - allow signed apps to automatically accept incoming connections

```puppet
class { 'osx::firewall::auto_allow_signed_applications':
  enabled => true,
}
```

`osx::firewall::block_all_incoming_connections` - block all non-essential incoming connections

```puppet
class { 'osx::firewall::block_all_incoming_connections':
  enabled => true,
}
```

`osx::firewall::logging_mode` - set firewall logging mode

```puppet
class { 'osx::firewall::logging_mode':
  enabled => true,
}
```

`osx::firewall::stealth_mode` - set whether firewall responds to innocuous requests like PING

```puppet
class { 'osx::firewall::stealth_mode':
  enabled => true,
}
```

### iTunes

`osx::itunes::automatic_device_backup_when_syncing` - set iTunes to automatically back up device on sync

```puppet
class { 'osx::itunes::automatic_device_backup_when_syncing':
  enabled => true,
}
```

`osx::itunes::automatic_sync` - set iTunes to automatically sync devices when connected

```puppet
class { 'osx::itunes::automatic_sync':
  enabled => true,
}
```

### Keyboard

`osx::keyboard::accented_press_and_hold` - press and hold for accented characters

```puppet
class { 'osx::keyboard::accented_press_and_hold':
  enabled => true,
}
```

`osx::keyboard::autocorrect` - enable autocorrect

```puppet
class { 'osx::keyboard::autocorrect':
  enabled => true,
}
```

`osx::keyboard::control_access` - set keyboard access for controls to one of the following:

* 'all_controls_including_dropdowns'
* 'all_controls'
* 'basic'

```puppet
class { 'osx::keyboard::control_access':
  mode => 'basic',
}
```

`osx::keyboard::default_to_alternate_function_keys` - default to "alternate" function keys when not holding the "fn" key

```puppet
class { 'osx::keyboard::default_to_alternate_function_keys':
  enabled => true,
}
```

`osx::keyboard::illumination` - enabled keyboard illumination, automatic brightness depending on ambient light, and idle time before illumination turns off

```puppet
class { 'osx::keyboard::illumination':
  enabled => true,
  auto_dim => true,
  auto_off_delay => 5,
}
```

`osx::keyboard::key_repeat_delay` - set the time in ms before key press repeats

```puppet
class { 'osx::keyboard::key_repeat_delay':
  delay => 35,
}
```

`osx::keyboard::key_repeat_rate` - the amount of time (in ms) before key repeat
  'presses'

```puppet
class { 'osx::keyboard::key_repeat_rate':
  rate => 0
}
```

### Launchpad

`osx::launchpad::reset` - reset launchpad

```puppet
include osx::launchpad::reset
```

### Login

`osx::login::admin_information` - show admin information when clicking the clock on the login screen

```puppet
class { 'osx::login::admin_information':
  enabled => true
}
```

`osx::login::auto_login` - automatically login a user

```puppet
class { 'osx::login::auto_login':
  enabled => true
}
```

`osx::login::fast_user_switching` - automatically login a user

```puppet
class { 'osx::login::fast_user_switching':
  enabled => true
}
```

`osx::login::guest` - enable guest account

```puppet
class { 'osx::login::guest':
  enabled => true
}
```

`osx::login::power_options` - show power options on the login screen

```puppet
class { 'osx::login::power_options':
  shown => true
}
```

`osx::login::retries_before_hint` - number of attempts before password hint is displayed

```puppet
class { 'osx::login::retries_before_hint':
  attempts => 5
}
```

`osx::login::style` - set the default login screen style to one of the following:

* 'name and password'

```puppet
class { 'osx::login::style':
  style => 'name and password'
}
```

### Menu Bar

`osx::menu_bar::airplay` - show the AirPlay Mirroring icon in the menu bar

```puppet
class { 'osx::menu_bar::airplay':
  enabled => true
}
```

`osx::menu_bar::date` - set the format of the date in the menu bar and set the clock to analog

```puppet

class { 'osx::menu_bar::date':
  format    => 'E MMM d  h:mm a',
  is_analog => true,
}
```

`osx::menu_bar::transparency` - set menu bar transparency
```puppet
class { 'osx::menu_bar::transparency':
  enabled => true
}
```

### Mission Control

`osx::mission_control::animation` - set speed of transitioning into and out of mission control

```puppet
class { 'osx::mission_control::animation':
  speed => 10
}
```

`osx::mission_control::dashboard_visibility` - toggle visibility of dashboard as a space in mission control

```puppet
class { 'osx::mission_control::dashboard_visibility':
  visible => true
}
```

`osx::mission_control::group_by_app` - group multiple windows for an app in mission control

```puppet
class { 'osx::mission_control::group_by_app':
  enabled => true
}
```

### Mouse

`osx::mouse::movement` - set scaling and speed of mouse cursor movement

```puppet
class { 'osx::mouse::movement':
  scaling         => 10,
  scrolling_speed => 10,
}
```

### Network

`osx::network::default_login_name` - set custom default login name for networks

```puppet
class { 'osx::network::default_login_name':
  default_name => 'name',
}
```

`osx::network::dsstores` - create .DS_Store files on network volumes

```puppet
class { 'osx::network::dsstores':
  enabled => true,
}
```

`osx::network::guest` - enable guest access to shared folders

```puppet
class { 'osx::network::guest':
  enabled => true,
}
```

### Printing

`osx::printing::quit_when_finished` - toggle whether the print dialog should disappear when all jobs are complete

```puppet
class { 'osx::printing::quit_when_finished':
  enabled => true,
}
```

### Safari

`osx::safari::find_only_matches_at_beginning_of_word` - toggle whether "Find On Page" matches only the beginnings of words

```puppet
class { 'osx::safari::find_only_matches_at_beginning_of_word':
  enabled => true,
}
```

`osx::safari::homepage` - set the default safari homepage

```puppet
class { 'osx::safari::homepage':
  page => 'github.com',
}
```

`osx::safari::thumbnail_cache` - toggle cache for "Top Sites" and "History"

```puppet
class { 'osx::safari::thumbnail_cache':
  enabled => true,
}
```

### Screensaver

`osx::screensaver::password_protection` - set password requirement to disable sreen saver, and delay before screen saver is required

```puppet
class { 'osx::screensaver::password_protection':
  enabled => true,
  delay => 0,
}
```

### Security

`osx::security::system_preference_lock` - lock system preferences

```puppet
class { 'osx::security::system_preference_lock':
  enabled => true,
}
```

### Sound

`osx::sound::bluetooth` - set the audio bitpool for bluetooth audio devices

```puppet
class { 'osx::sound::bluetooth':
  audio_bitpool => 36,
}
```

`osx::sound::ui` - toggle and set volume for UI sound effects

```puppet
class { 'osx::sound::ui':
  enable => true,
  level => 36,
}
```

`osx::sound::volume_feedback` - toggle volume change feedback sound

```puppet
class { 'osx::sound::volume_feedback':
  enable => true,
}
```

### System

`osx::system::update::automatic_downloads` - toggle downloading software updates in the background when available

```puppet
class { 'osx::system::update::automatic_downloads':
  enable => true,
}
```

`osx::system::update::local_cdn` - toggle downloading software updates in the background when available

```puppet
class { 'osx::system::update::local_cdn':
  enable => true,
}
```

`osx::system::update::schedule` - set the interval between software update checks to one of the following:

* 'daily'

```puppet
class { 'osx::system::update::schedule':
  frequencey => 'daily',
}
```

`osx::system::app_quarantine` - toggle the downloaded app quarantine

```puppet
class { 'osx::system::app_quarantine':
  enable => true,
}
```

`osx::system::automatic_app_termination` - toggle whether to automatically quit idle apps

```puppet
class { 'osx::system::automatic_app_termination':
  enable => true,
}
```

`osx::system::crash_reporter` - send usage statistics to Apple

```puppet
class { 'osx::system::crash_reporter':
  enable => true,
}
```

`osx::system::host_name` - set your host name

```puppet
class { 'osx::system::host_name':
  name => 'localHost',
}
```

`osx::system::restart_on_hang` - restart automatically if system hangs

```puppet
class { 'osx::system::restart_on_hang':
  enabled => true,
}
```

`osx::system::save_documents_to_icloud_by_default` - save documents to iCloud by default

```puppet
class { 'osx::system::save_documents_to_icloud_by_default':
  enabled => true,
}
```

`osx::system::save_windows_on_quit` - save windows and positions when restarting/quitting

```puppet
class { 'osx::system::save_windows_on_quit':
  enabled => true,
}
```

`osx::system::ui_server`

```puppet
include osx::system::ui_server
```

### Time Machine

`osx::time_machine::ask_to_use_new_disks_for_backup`

```puppet
class { 'osx::time_machine::ask_to_use_new_disks_for_backup':
  enabled => true,
}
```

`osx::time_machine::local_backups`

```puppet
class { 'osx::time_machine::local_backups':
  enabled => true,
}
```

`osx::time_machine::unsupported_network_volumes`

```puppet
class { 'osx::time_machine::unsupported_network_volumes':
  enabled => true,
}
```

### Touchpad

`osx::touchpad::gestures::app_expose` - toggle swipe for app expose

```puppet
class { 'osx::touchpad::gestures::app_expose':
  enabled => true,
}
```

`osx::touchpad::gestures::four_finger_horizontal_swipe` - set the effect for left/right swipe with four fingers to one of the following:

* 'disable'
* 'switch apps'

```puppet
class { 'osx::touchpad::gestures::four_finger_horizontal_swipe':
  effect => 'disable',
}
```

`osx::touchpad::gestures::four_finger_vertical_swipe` - set the effect for up/down swipe with four fingers to one of the following:

* 'disable'
* 'mission control'

```puppet
class { 'osx::touchpad::gestures::four_finger_vertical_swipe':
  effect => 'disable',
}
```

`osx::touchpad::gestures::launchpad` - toggle pinch with thumb and thee fingers for launchpad

```puppet
class { 'osx::touchpad::gestures::launchpad':
  enabled => true,
}
```

`osx::touchpad::gestures::page_swiping` - toggle swipe to switch pages

```puppet
class { 'osx::touchpad::gestures::page_swiping':
  enabled => true,
}
```

`osx::touchpad::gestures::secondary_click` - toggle secondary 'right click' on internal toucpad, external touchpad, and magic mouse

```puppet
class { 'osx::touchpad::gestures::secondary_click':
  enabled => true,
}
```

`osx::touchpad::gestures::tap_to_click` - toggle touchpad tap to click

```puppet
class { 'osx::touchpad::gestures::tap_to_click':
  enabled => true,
}
```

### Universal Access Settings

* `osx::universal_access::ctrl_mod_zoom` - enables zoom by scrolling while
  holding Control
* `osx::universal_access::enable_scrollwheel_zoom` - enables zoom using the
  scroll wheel

## Customizable Settings

These settings can be used like one-shots or customized.

`osx::universal_access::cursor_size` - the amount the cursor will be zoomed

```puppet
include osx::universal_access::cursor_size

class { 'osx::universal_access::cursor_size':
  zoom => 1.5
}
```

## Airdrop

```puppet
class { 'osx::aidrop::all_interfaces':
  allow => true
}
```

## Airport

`osx::airport::disconnect_on_logout` - disconnect from airport on logout

```puppet
class { 'osx::airport:disconnect_on_logout':
  enabled => true
}
```

`osx::airport::join_mode` - set airport join mode to one of the following:

* Automatic
* Preferred
* Ranked
* Recent
* Strongest

```puppet
class { 'osx::airport::join_mode':
  mode => 'Automatic'
}
```

`osx::airport::join_mode_fallback` - set airport join mode fallback to one of the following:

* Prompt
* JoinOpen
* KeepLooking
* DoNothing

```puppet
class { 'osx::airport::join_mode_fallback':
  mode => 'Prompt'
}
```

`osx::airport::remember_recent_networks` - toggle airport's "Remember Recent Networks" preference

```puppet
class { 'osx::airport::remember_recent_networks':
  enabled => true
}
```

`osx::airport::require_password_for_computer_to_computer_networks` - toggle airport's "Require Password for Computer-to-Computer Networks" preference

```puppet
class { 'osx::airport::require_password_for_computer_to_computer_networks':
  enabled => true
}
```

`osx::airport::require_password_to_change_networks` - toggle airport's "Require Password to Change Networks" preference

```puppet
class { 'osx::airport::require_password_to_change_networks':
  enabled => true
}
```

`osx::airport::require_password_to_toggle_power` - toggle airport's "Require Password to Turn Wi-Fi On or Off" preference

```puppet
class { 'osx::airport::require_password_to_toggle_power':
  enabled => true
}
```

## Appearance

`osx::appearance::colors` - set main UI and highlight colors

```puppet
class { 'osx::appearance::colors':
  main      => 'graphite',
  highlight => 'graphite'
}
```

`osx::appearance::font_rendering_mode` - set rendering mode used to display text

```puppet
class { 'osx::appearance::font_rendering_mode':
  mode => 1
}
```

`osx::appearance::sidebar_icons` - set the size of the icons in the sidebar

```puppet
class { 'osx::appearance::sidebar_icons':
  size => 'small'
}

class { 'osx::appearance::sidebar_icons':
  size => 'medium'
}

class { 'osx::appearance::sidebar_icons':
  size => 'large'
}
```

## Desktop

`osx::desktop::displayed_items` - display items on desktop

```puppet
class { 'osx::desktop::displayed_items':
    internal_hard_drives => true,
    external_hard_drives => true,
    mounted_servers => true,
    removable_media => true,
}
```

## Dialogs

`osx::dialogs::auto_expanding_print_dialog` - expand print panel by default

```puppet
class { 'osx::dialogs::auto_expanding_print_dialog':
  enabled => true
}
```

`osx::dialogs::auto_expanding_save_dialog` - expand save panel by default

```puppet
class { 'osx::dialogs::auto_expanding_save_dialog':
  enabled => true
}
```

`osx::dialogs::file_view_mode` - set default file dialog view mode

```puppet
class { 'osx::dialogs::file_vew_mode':
  mode => 'list'
}
```

## Disk Images

`osx::disk_images::auto_mount` - set disk images to auto-mount

```puppet
class { 'osx::disk_images::auto_mount':
  enabled => true
}
```

`osx::disk_images::verification` - set verification of disk images

```puppet
class { 'osx::disk_images::verification':
  enabled => true
}
```

## Disk Utility

`osx::disk_utility::advanced_image_options` - toggle advanced image options in disk utility

```puppet
class { 'osx::disk_utility::advanced_image_options':
  enabled => true
}
```

`osx::disk_utility::hidden_partitions` - toggle visibility of hidden partitions

```puppet
class { 'osx::disk_utility::hidden_partitions':
  visible => true
}
```

## Displays

`osx::displays::auto_brightness_adjustment` - toggle ambient light-dependent automatic brightness adjustment

```puppet
class { 'osx::displays::auto_brightness_adjustment':
  enabled => true
}
```

## Required Puppet Modules

* boxen
* property_list_key

## Developing

Write code.

Run `script/cibuild`.
