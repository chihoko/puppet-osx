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

### Global Settings

* `osx::global::disable_key_press_and_hold` - disable press-and-hold for
  accented character entry
* `osx::global::enable_keyboard_control_access` - enables the keyboard for
  navigating controls in dialogs
* `osx::global::expand_print_dialog` - expand the print dialog by default
* `osx::global::expand_save_dialog` - expand the save dialog by default

### Dock Settings

* `osx::dock::2d` - use the old flat dock style
* `osx::dock::autohide` - automatically hide the dock
* `osx::dock::clear_dock` - ensures the dock only contains apps that are running
* `osx::dock::dim_hidden_apps` - dims icons of hidden apps
* `osx::dock::hide_indicator_lights` - remove the indicator lights below running
  apps

### Finder Settings

* `osx::finder::show_external_hard_drives_on_desktop`
* `osx::finder::show_hard_drives_on_desktop`
* `osx::finder::show_mounted_servers_on_desktop`
* `osx::finder::show_removable_media_on_desktop`
* `osx::finder::show_all_on_desktop` - does all of the above
* `osx::finder::empty_trash_securely` - enable Secure Empty Trash
* `osx::finder::unhide_library` - unsets the hidden flag on ~/Library

### Universal Access Settings

* `osx::universal_access::ctrl_mod_zoom` - enables zoom by scrolling while
  holding Control
* `osx::universal_access::enable_scrollwheel_zoom` - enables zoom using the
  scroll wheel

### Miscellaneous Settings

* `osx::disable_app_quarantine` - disable the downloaded app quarantine
* `osx::no_network_dsstores` - disable creation of .DS_Store files on network
  shares

## Customizable Settings

These settings can be used like one-shots or customized.

`osx::global::key_repeat_delay` - the amount of time (in ms) before a key starts
  repeating

```puppet
# Set the default value (35)
include osx::global::key_repeat_delay

# ... or set your own
class { 'osx::global::key_repeat_delay':
  delay => 10
}
```

`osx::global::key_repeat_rate` - the amount of time (in ms) before key repeat
  'presses'

```puppet
# Set the default value (0)
include osx::global::key_repeat_rate

# ... or set your own
class { 'osx::global::key_repeat_rate':
  rate => 2
}
```

`osx::universal_access::cursor_size` - the amount the cursor will be zoomed

```puppet
# Set the default value (1.5)
include osx::universal_access::cursor_size

# ... or set your own
class { 'osx::universal_access::cursor_size':
  zoom => 2
}
```

`osx::dock::icon_size` - the size of the dock icons, in pixels

```puppet
include osx::dock::icon_size

class { 'osx::dock::icon_size': 
  size => 36
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


## Required Puppet Modules

* boxen
* property_list_key

## Developing

Write code.

Run `script/cibuild`.
