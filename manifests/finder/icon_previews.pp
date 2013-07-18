class osx::finder::icon_previews($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::finder::icon_previews([ensure] must be present or absent, is ${ensure}")

  include osx::finder

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  exec { [
    "/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:IconViewSettings:showIconPreview ${enabled}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    "/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:ListViewSettings:showIconPreview ${enabled}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    "/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:ExtendedListViewSettings:showIconPreview ${enabled}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    "/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:IconViewSettings:showIconPreview ${enabled}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    "/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:ListViewSettings:showIconPreview ${enabled}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    "/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:ExtendedListViewSettings:showIconPreview ${enabled}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    "/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:IconViewSettings:showIconPreview ${enabled}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    "/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:ListViewSettings:showIconPreview ${enabled}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    "/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:ExtendedListViewSettings:showIconPreview ${enabled}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
  ]:

    notify => [
      Exec['killall Finder'],
      Exec['Remove All .DS_Store Files'],
      Exec['Remove All Existing Icon Previews'],
    ],
  }

  boxen::osx_defaults { 'Remove All Existing Icon Previews':
    user   => $::boxen_user,
    key    => 'FXRecentFolders',
    domain => 'com.apple.finder',
    type   => 'array',
    value  => '()',
    notify => Exec['killall Finder'],
  }
}
