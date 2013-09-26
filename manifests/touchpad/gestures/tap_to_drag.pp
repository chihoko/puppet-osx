class osx::touchpad::gestures::tap_to_drag($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::touchpad::gestures::tap_to_drag([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Toggle the Ability Drag with an External Touchpad':
    user   => $::boxen_user,
    domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
    key    => 'Dragging',
    type   => 'int',
    value  => $enabled_int,
  }
}
