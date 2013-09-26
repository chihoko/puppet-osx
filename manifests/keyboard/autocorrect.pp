class osx::keyboard::autocorrect($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::keyboard::autocorrect([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Auto-Correct':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'NSAutomaticSpellingCorrectionEnabled',
    value  => $enabled,
  }
}
