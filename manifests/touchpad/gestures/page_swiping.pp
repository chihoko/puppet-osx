class osx::touchpad::gestures::page_swiping($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::touchpad::gestures::page_swiping([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Toggle the Ability to Swipe to Switch Pages':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'AppleEnableSwipeNavigateWithScrolls',
    value  => $enabled_int,
  }
}
