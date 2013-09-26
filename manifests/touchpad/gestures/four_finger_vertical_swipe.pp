class osx::touchpad::gestures::four_finger_vertical_swipe($effect = 'disabled') {

  validate_re($effect, '^(disabled|mission control)$', "osx::touchpad::gestures::four_finger_vertical_swipe([effect] must be disabled or switch apps, is ${effect}")

  $effect_int = $effect ? {
    'mission control' => 2,
    default           => 0
  }

  boxen::osx_defaults { 'Sets the Effect for Swiping Up/Down with Four Fingers - Part 1':
    user   => $::boxen_user,
    domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
    key    => 'TrackpadFourFingerVertSwipeGesture',
    value  => $effect_int,
  }

  boxen::osx_defaults { 'Sets the Effect for Swiping Up/Down with Four Fingers - Part 2':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.trackpad.fourFingerVertSwipeGesture',
    host   => 'currentHost',
    value  => $effect_int,
  }
}
