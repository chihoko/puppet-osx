class osx::screen_capture(
  $format     = undef,
  $location   = undef,
  $add_shadow = undef,
  $base_name  = undef) {


  if $format != undef {
    validate_re($format, '^(jpg)$', "osx::screen_capture([format] must be jpg, is ${format}")
    boxen::osx_defaults { 'Sets the Format of Images Taken With Screen Capture':
      user   => $::boxen_user,
      key    => 'type',
      domain => 'com.apple.screencapture',
      value  => $format,
    }
  }

  if $location != undef {
    boxen::osx_defaults { 'Sets the Location of Images Taken With Screen Capture':
      user   => $::boxen_user,
      key    => 'location',
      domain => 'com.apple.screencapture',
      value  => $location,
    }
  }

  if $add_shadow != undef {
    validate_bool($add_shadow)
    boxen::osx_defaults { 'Toggles Whether Images Taken With Screen Capture Include Drop Shadows':
      user   => $::boxen_user,
      key    => 'disable-shadow',
      domain => 'com.apple.screencapture',
      value  => !$add_shadow,
    }
  }

  if $base_name != undef {
    boxen::osx_defaults { 'Sets the Base Filename Used for Screenshots':
      user   => $::boxen_user,
      key    => 'name',
      domain => 'com.apple.screencapture',
      value  => $base_name,
    }
  }
}
