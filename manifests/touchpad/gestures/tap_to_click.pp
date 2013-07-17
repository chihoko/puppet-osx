class osx::touchpad::gestures::tap_to_click($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::touchpad::gestures::tap_to_click([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Toggle the Ability to Tap the Touchpad to Click - Part 1':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.mouse.tapBehavior',
    type   => 'int',
    value  => $enabled_int,
  }

  boxen::osx_defaults { 'Toggle the Ability to Tap the Touchpad to Click - Part 2':
    user   => $::boxen_user,
    domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
    key    => 'Clicking',
    type   => 'int',
    value  => $enabled_int,
  }

  boxen::osx_defaults { 'Toggle the Ability to Tap the Touchpad to Click - Part 3':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.mouse.tapBehavior',
    host   => 'currentHost',
    type   => 'int',
    value  => $enabled_int,
  }
}
