class osx::dock::indicator_lights($ensure = 'present') {
  include osx::dock

  validate_re($ensure, '^(present|absent)$', "osx::dock::indicator_lights([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Indicator Lights Under Running Applications':
    user   => $::boxen_user,
    domain => 'com.apple.dock',
    key    => 'show-process-indicators',
    value  => $enabled,
    notify => Exec['killall Dock'],
  }
}
