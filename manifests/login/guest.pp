class osx::login::guest($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::login::guest([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Toggles Whether to Allow the Guest Account to Login':
    user   => root,
    key    => 'GuestEnabled',
    domain => '/Library/Preferences/com.apple.loginwindow',
    type   => 'int',
    value  => $enabled_int,
    notify => Exec['killall SystemUIServer'],
  }
}
