class osx::login::fast_user_switching($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::login::fast_user_switching([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggles Whether Allow Fast User Switching':
    user   => root,
    key    => 'MultipleSessionEnabled',
    domain => '/Library/Preferences/.GlobalPreferences',
    value  => $enabled,
    notify => Exec['killall SystemUIServer'],
  }
}
