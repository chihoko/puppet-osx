class osx::finder::springing(
  $ensure = 'present',
  $delay  = undef) {

  validate_re($ensure, '^(present|absent)$', "osx::finder::springing([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggles Whether Springing is Enabled':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.springing.enabled',
    value  => $enabled,
  }

  if $delay != undef {
    boxen::osx_defaults { 'Sets the Delay Before a Hovered Item "Springs"':
      user   => $::boxen_user,
      domain => 'NSGlobalDomain',
      key    => 'com.apple.springing.delay',
      type   => 'float',
      value  => $delay,
    }
  }
}
