class osx::touchpad::gestures::launchpad($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::touchpad::gestures::launchpad([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle the Ability to Pinch with Thumb and Three Fingers for Launchpad':
    user   => $::boxen_user,
    domain => 'com.apple.dock',
    key    => 'showLaunchpadGestureEnabled',
    value  => $enabled,
  }
}
