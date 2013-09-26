class osx::touchpad::gestures::secondary_click($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::touchpad::gestures::secondary_click([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  $mouse_mode = $ensure ? {
    present => 'TwoButton',
    default => 'OneButton'
  }

  boxen::osx_defaults { 'Toggle Secondary "Right" Click on Internal Touchpad':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.trackpad.enableSecondaryClick',
    value  => $enabled,
  }

  boxen::osx_defaults { 'Toggle Secondary "Right" Click on External Touchpad':
    user   => $::boxen_user,
    domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
    key    => 'TrackpadRightClick',
    value  => $enabled,
  }

  boxen::osx_defaults { 'Toggle Secondary "Right" Click on Magic Mouse':
    user   => $::boxen_user,
    domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
    key    => 'MouseButtonMode',
    value  => $mouse_mode,
  }
}
