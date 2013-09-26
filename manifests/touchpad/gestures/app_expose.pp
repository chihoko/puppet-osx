class osx::touchpad::gestures::app_expose($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::touchpad::gestures::app_expose([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Toggle the Ability to Swipe for App Expose':
    user   => $::boxen_user,
    domain => 'com.apple.dock',
    key    => 'showAppExposeGestureEnabled',
    value  => $enabled_int,
  }
}
