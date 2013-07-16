# TODO add validation of date formats
#

class osx::menu_bar::date(
  $format    = undef,
  $is_analog = undef) {

  if $format != undef {
    boxen::osx_defaults { 'Sets the Format of the Date in the Menu Bar':
      user   => $::boxen_user,
      key    => 'DateFormat',
      domain => 'com.apple.menuextra.clock',
      value  => $format,
      notify => Exec['killall SystemUIServer'],
    }
  }

  if $is_analog != undef {
    validate_bool($is_analog)
    boxen::osx_defaults { 'Sets the Time to be an Analog Clock':
      user   => $::boxen_user,
      key    => 'IsAnalog',
      domain => 'com.apple.menuextra.clock',
      value  => $is_analog,
      notify => Exec['killall SystemUIServer'],
    }
  }
}
