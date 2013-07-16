# OSX Defaults Module for Puppet

[![Build Status](https://travis-ci.org/boxen/puppet-osx.png?branch=master)](https://travis-ci.org/boxen/puppet-osx)

Provides classes for setting various defaults in Mac OS X. Also provides a means
to set a "recovery message" to be displayed on the login and lock screens.

## Airdrop

```puppet
include osx::airdrop::all_interfaces

class { 'osx::aidrop::all_interfaces':
  ensure => 'present'
}
```

## Airport

`osx::airport::disconnect_on_logout` - disconnect from airport on logout

```puppet
include osx::airport::disconnect_on_logout

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
include osx::airport::remember_recent_networks

class { 'osx::airport::remember_recent_networks':
  ensure => 'present'
}
```

`osx::airport::require_password_for_computer_to_computer_networks` - toggle airport's "Require Password for Computer-to-Computer Networks" preference

```puppet
include osx::airport::require_password_for_computer_to_computer_networks

class { 'osx::airport::require_password_for_computer_to_computer_networks':
  ensure => 'present'
}
```

`osx::airport::require_password_to_change_networks` - toggle airport's "Require Password to Change Networks" preference

```puppet
include osx::airport::require_password_to_change_networks

class { 'osx::airport::require_password_to_change_networks':
  ensure => 'present'
}
```

`osx::airport::require_password_to_toggle_power` - toggle airport's "Require Password to Turn Wi-Fi On or Off" preference

```puppet
include osx::airport::require_password_to_toggle_power

class { 'osx::airport::require_password_to_toggle_power':
  ensure => 'present'
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

## Dashboard

`osx::dashboard` - enable dashboard

```puppet
class { 'osx::dashboard':
  enabled => false,
}
```

## Debug Mode

`osx::debug_mode` - toggles various debug modes

```puppet
class { 'osx::debug_mode':
  enabled => true,
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
include osx::dialogs::auto_expanding_print_dialog

class { 'osx::dialogs::auto_expanding_print_dialog':
  ensure => 'present'
}
```

`osx::dialogs::auto_expanding_save_dialog` - expand save panel by default

```puppet
include osx::dialogs::auto_expanding_save_dialog

class { 'osx::dialogs::auto_expanding_save_dialog':
  ensure => 'present'
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
include osx::dialogs::auto_expanding_save_dialog

class { 'osx::disk_images::auto_mount':
  ensure => 'present'
}
```

`osx::disk_images::verification` - set verification of disk images

```puppet
include osx::disk_images::verification

class { 'osx::disk_images::verification':
  ensure => 'present'
}
```

## Disk Utility

`osx::disk_utility::advanced_image_options` - toggle advanced image options in disk utility

```puppet
include osx::disk_utility::advanced_image_options

class { 'osx::disk_utility::advanced_image_options':
  ensure => 'present'
}
```

`osx::disk_utility::hidden_partitions` - toggle visibility of hidden partitions

```puppet
include osx::disk_utility::hidden_partitions

class { 'osx::disk_utility::hidden_partitions':
  ensure => 'present'
}
```

## Displays

`osx::displays::auto_brightness_adjustment` - toggle ambient light-dependent automatic brightness adjustment

```puppet
include osx::dialogs::auto_expanding_save_dialog

class { 'osx::displays::auto_brightness_adjustment':
  ensure => 'present'
}
```

## Dock

`osx::dock::autohide` - automatically hide the dock

```puppet
include osx::dock::autohide

class { 'osx::dock::autohide':
  ensure => 'present'
  delay   => 0,
}
```

`osx::dock::clear` - ensures the dock only contains apps that are running

```puppet
include osx::dock::clear
```

`osx::dock::hidden_app_dimming` - dims icons of hidden apps

```puppet
include osx::dock::hidden_app_dimming

class { 'osx::dock::hidden_app_dimming':
  ensure => 'present'
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
include osx::dock::indicator_lights

class { 'osx::dock::indicator_lights':
  ensure => 'present'
}
```

`osx::dock::itunes_notifications` - toggle the indicator lights below running applications

```puppet
include osx::dock::itunes_notifications

class { 'osx::dock::itunes_notifications':
  ensure => 'present'
}
```

`osx::dock::magnification` - toggles magnification of icons and sets icon magnification size

```puppet
include osx::dock::magnification

class { 'osx::dock::magnification':
  ensure => 'present'
  magnified_icon_size => 48,
}
```

`osx::dock::only_show_running_apps` - only show running applications in the dock

```puppet
include osx::dock::only_show_running_apps

class { 'osx::dock::only_show_running_apps':
  ensure => 'present'
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

## Energy

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

## Finder

`osx::finder::allow_quit` - allow quit finder

```puppet
include osx::finder::allow_quit

class { 'osx::finder::allow_quit':
  ensure => 'present'
}
```

`osx::finder::animations` - enable finder animations

```puppet
include osx::osx::finder::animations

class { 'osx::finder::animations':
  ensure => 'present'
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
  style => 'grid'
}
```

`osx::finder::icon_previews` - enable icon previews in finder

```puppet
include osx::finder::icon_previews

class { 'osx::finder::icon_previews':
  ensure => 'present'
}
```

`osx::finder::path_bar` - enable path bar in finder

```puppet
include osx::finder::path_bar

class { 'osx::finder::path_bar':
  ensure => 'present'
}
```

`osx::finder::posix_title_path` - enable full POSIX path in finder title bar

```puppet
include osx::finder::posix_title_path

class { 'osx::finder::posix_title_path':
  ensure => 'present'
}
```

`osx::finder::quicklook_text_selection` - enable text selection in QuickLook Window

```puppet
include osx::finder::quicklook_text_selection

class { 'osx::finder::quicklook_text_selection':
  ensure => 'present'
}
```

`osx::finder::springing` - enable springing and set spring delay

```puppet
class { 'osx::finder::springing':
  ensure => 'present'
  delay => 0,
}
```

`osx::finder::status_bar` - display status bar in finder

```puppet
include osx::finder::status_bar

class { 'osx::finder::status_bar':
  ensure => 'present'
}
```

`osx::finder::unhide_library` - unsets the hidden flag on ~/Library


## Firewall

`osx::firewall` - toggles firewall

```puppet
class { 'osx::firewall
  enabled => true,
}
```

`osx::firewall::auto_allow_signed_applications` - allow signed apps to automatically accept incoming connections

```puppet
include osx::firewall::auto_allow_signed_applications

class { 'osx::firewall::auto_allow_signed_applications':
  ensure => 'present'
}
```

`osx::firewall::block_all_incoming_connections` - block all non-essential incoming connections

```puppet
include osx::firewall::block_all_incoming_connections

class { 'osx::firewall::block_all_incoming_connections':
  ensure => 'present'
}
```

`osx::firewall::logging_mode` - set firewall logging mode

```puppet
include osx::firewall::logging_mode

class { 'osx::firewall::logging_mode':
  ensure => 'present'
}
```

`osx::firewall::stealth_mode` - set whether firewall responds to innocuous requests like PING

```puppet
include osx::firewall::stealth_mode

class { 'osx::firewall::stealth_mode':
  ensure => 'present'
}
```

## Gatekeeper

`osx::gatekeeper` - toggles gatekeeper

```puppet
class { 'osx::gatekeeper
  enabled => true,
}
```

## Hot Corners

`osx::hot_corners` - set actions to hot corners:

Corners:

* 'bottom left'
* 'bottom right'
* 'top right'
* 'top left'

Actions:

* 'do nothing'
* 'mission control'
* 'show application windows'
* 'desktop'
* 'start screensaver'
* 'disable screensaver'
* 'dashboard'
* 'sleep display'
* 'launchpad'
* 'notification center'

```puppet
class { 'osx::hot_corners
  corner => 'bottom left',
  action => 'mission control',
}
```

## iTunes

`osx::itunes::automatic_device_backup_when_syncing` - set iTunes to automatically back up device on sync

```puppet
osx::itunes::automatic_device_backup_when_syncing

class { 'osx::itunes::automatic_device_backup_when_syncing':
  ensure => 'present'
}
```

`osx::itunes::automatic_sync` - set iTunes to automatically sync devices when connected

```puppet
include osx::itunes::automatic_sync

class { 'osx::itunes::automatic_sync':
  ensure => 'present'
}
```

## Keyboard

`osx::keyboard::accented_press_and_hold` - press and hold for accented characters

```puppet
include osx::keyboard::accented_press_and_hold

class { 'osx::keyboard::accented_press_and_hold':
  ensure => 'present'
}
```

`osx::keyboard::autocorrect` - enable autocorrect

```puppet
include osx::keyboard::autocorrect

class { 'osx::keyboard::autocorrect':
  ensure => 'present'
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
include osx::keyboard::default_to_alternate_function_keys

class { 'osx::keyboard::default_to_alternate_function_keys':
  ensure => 'present'
}
```

`osx::keyboard::illumination` - enabled keyboard illumination, automatic brightness depending on ambient light, and idle time before illumination turns off

```puppet
class { 'osx::keyboard::illumination':
  ensure => 'present'
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

## Launchpad

`osx::launchpad::reset` - reset launchpad

```puppet
include osx::launchpad::reset
```

## Login

`osx::login::admin_information` - show admin information when clicking the clock on the login screen

```puppet
include osx::login::admin_information

class { 'osx::login::admin_information':
  ensure => 'present'
}
```

`osx::login::auto_login` - automatically login a user

```puppet
include osx::login::auto_login

class { 'osx::login::auto_login':
  ensure => 'present'
}
```

`osx::login::fast_user_switching` - automatically login a user

```puppet
include osx::login::fast_user_switching

class { 'osx::login::fast_user_switching':
  ensure => 'present'
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

## Menu Bar

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

## Mission Control

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

## Mouse

`osx::mouse::movement` - set scaling and speed of mouse cursor movement

```puppet
class { 'osx::mouse::movement':
  scaling         => 10,
  scrolling_speed => 10,
}
```

## Network

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

## Printing

`osx::printing::quit_when_finished` - toggle whether the print dialog should disappear when all jobs are complete

```puppet
class { 'osx::printing::quit_when_finished':
  enabled => true,
}
```

## Safari

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

## Screen Capture

`osx::screen_capture` - set screen capture settings

```puppet
class { 'osx::screen_capture
  format     => 'jpg',
  location   => '/tmp',
  add_shadow => false,
  base_name  => 'screencap_',
}
```

## Screensaver

`osx::screensaver::password_protection` - set password requirement to disable sreen saver, and delay before screen saver is required

```puppet
class { 'osx::screensaver::password_protection':
  enabled => true,
  delay => 0,
}
```

## Security

`osx::security::system_preference_lock` - lock system preferences

```puppet
class { 'osx::security::system_preference_lock':
  enabled => true,
}
```

## Sound

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

## System

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

`osx::system::recovery_message` - set the system recovery message

```puppet
class { 'osx::system::recovery_message':
  enabled => true,
  value => 'message',
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

## Time Machine

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

## Touchpad

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

`osx::touchpad::gestures::tap_to_drag` - toggle touchpad tap to drag

```puppet
class { 'osx::touchpad::gestures::tap_to_drag':
  enabled => true,
}
```

`osx::touchpad::gestures::three_finger_horizontal_swipe` - set the effect for swiping left/right with three fingers

* 'switch pages'
* 'switch apps'

```puppet
class { 'osx::touchpad::gestures::three_finger_horizontal_swipe':
  effect => 'switch pages',
}
```

`osx::touchpad::gestures::three_finger_vertical_swipe` - set the effect for swiping up/down with three fingers

* 'disabled'
* 'mission control'

```puppet
class { 'osx::touchpad::gestures::three_finger_vertical_swipe':
  effect => 'disabled',
}
```

`osx::touchpad::movement` - set speed of trackpad cursor movement and trackpad scrolling

```puppet
class { 'osx::touchpad::movement':
  scaling => 5,
  scrolling_speed => 10,
}
```

## Trash

`osx::trash::when_emptying` - toggle empty trash warning and secure trash emptying

```puppet
class { 'osx::trash::when_emptying':
  warn   => false,
  secure => true,
}
```

## Universal Access

`osx::universal_access::assistive_device_access` - toggle assistive device access

```puppet
class { 'osx::universal_access::assistive_device_access':
  enabled => true,
}
```

`osx::universal_access::ctrl_mod_zoom` - enables zoom by scrolling while holding Control

```puppet
include osx::universal_access::ctrl_mod_zoom
```

`osx::universal_access::cursor_size` - the amount the cursor will be zoomed

```puppet
include osx::universal_access::cursor_size

class { 'osx::universal_access::cursor_size':
  zoom => 1.5
}
```

`osx::universal_access::flash_screen` - toggle screen flashing on alert

```puppet
class { 'osx::universal_access::flash_screen':
  enabled => false,
}
```

`osx::universal_access::enable_scrollwheel_zoom` - enables zoom using the scroll wheel

## Windows

`osx::windows::animations` - toggle open/close window animations and set the length of time in seconds when a window is resized

```puppet
class { 'osx::windows::animations':
  enabled => true,
  resize_duration => 4,
}
```

`osx::windows::miniaturize_on_double_click` - miniaturize windows on double-click

```puppet
class { 'osx::windows::miniaturize_on_double_click':
  enabled => true,
}
```

`osx::windows::scroll_bars` - set the scrollbar ode

```puppet
class { 'osx::windows::scroll_bars':
  style => "Automatic"
}
```

## Required Puppet Modules

* boxen
* property_list_key

## Developing

Write code.

Run `script/cibuild`.
