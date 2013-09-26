class osx::login::power_options($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::login::power_options([ensure] must be present or absent, is ${ensure}")

  $shown_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Toggles Whether to Show Power Options on the Login Screen':
    user   => root,
    key    => 'PowerOffDisabled',
    domain => '/Library/Preferences/com.apple.loginwindow',
    type   => 'int',
    value  => $shown_int,
    notify => Exec['killall SystemUIServer'],
  }
}
