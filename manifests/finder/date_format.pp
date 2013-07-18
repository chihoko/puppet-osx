class osx::finder::date_format($format = 'relative') {

  validate_re($format, '^(relative|absolute)$', "osx::finder::date_format([ensure] must be relative or absolute, is ${format}")

  include osx::finder

  $format_bool = $format ? {
    'relative' => true,
    default => false
  }

  exec { [
    "/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:ListViewSettings:useRelativeDates ${format_bool}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    "/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:ExtendedListViewSettings:useRelativeDates ${format_bool}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    "/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:ListViewSettings:useRelativeDates ${format_bool}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    "/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:ExtendedListViewSettings:useRelativeDates ${format_bool}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    "/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:ListViewSettings:useRelativeDates ${format_bool}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    "/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:ExtendedListViewSettings:useRelativeDates ${format_bool}' /Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
  ]:

    notify => [
      Exec['killall Finder'],
      Exec['Remove All .DS_Store Files'],
    ]
  }
}
