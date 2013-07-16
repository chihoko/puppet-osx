class osx::keyboard::accented_press_and_hold($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::keyboard::accented_press_and_hold([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Press-and-Hold for Accented Characters':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'ApplePressAndHoldEnabled',
    value  => $enabled,
  }
}
