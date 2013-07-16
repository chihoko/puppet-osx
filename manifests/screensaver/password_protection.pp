class osx::screensaver::password_protection(
  $ensure = 'present',
  $delay   = undef) {

  validate_re($ensure, '^(present|absent)$', "osx::screensaver::password_protection([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Toggles Whether or not a Password is Required to Disable the Screensaver':
    user   => $::boxen_user,
    key    => 'askForPassword',
    domain => 'com.apple.screensaver',
    value  => $enabled_int,
  }

  if is_integer($delay) {
    boxen::osx_defaults { 'Set the Delay Before a Password is Required':
      user   => $::boxen_user,
      key    => 'askForPasswordDelay',
      domain => 'com.apple.screensaver',
      value  => $delay,
    }
  }
}
