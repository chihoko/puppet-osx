class osx::keyboard::illumination(
  $ensure         = 'present',
  $auto_dim       = undef,
  $auto_off_delay = undef) {


  validate_re($ensure, '^(present|absent)$', "osx::finder::allow_quit([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether Keyboard Illuminates':
    user   => $::boxen_user,
    domain => 'com.apple.BezelServices',
    key    => 'kDim',
    value  => $enabled,
  }

  if $auto_dim != undef {
    validate_bool($auto_dim)
    boxen::osx_defaults { 'Toggle Keyboard Illumination Brightness Changes Depending on Ambient Light':
      user   => $::boxen_user,
      domain => 'com.apple.BezelServices',
      key    => 'dAuto',
      value  => $auto_dim,
    }
  }

  if is_integer($auto_off_delay)  {
    boxen::osx_defaults { 'Set Idle Time Before Keyboard Illumination Turns Off':
      user   => $::boxen_user,
      domain => 'com.apple.BezelServices',
      key    => 'kDimTime',
      type   => 'int',
      value  => $auto_off_delay,
    }
  }
}
