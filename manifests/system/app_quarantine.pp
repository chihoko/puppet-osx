class osx::system::app_quarantine($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::system::app_quarantine([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle the Downloaded App Quarantine':
    user   => $::boxen_user,
    key    => 'LSQuarantine',
    domain => 'com.apple.LaunchServices',
    value  => $enabled,
  }
}
