class osx::login::auto_login($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::login::auto_login([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggles Whether to Automatically Login a User':
    user   => root,
    key    => 'autoLoginUser',
    domain => '/Library/Preferences/com.apple.loginwindow',
    value  => $enabled,
    notify => Exec['killall SystemUIServer'],
  }

  if !$enabled {
    file { '/etc/kcpassword':
      ensure => absent,
    }
  }
}
