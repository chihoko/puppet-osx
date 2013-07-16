class osx::mission_control::dashboard_visibility($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::mission_control::dashboard_visibility([ensure] must be present or absent, is ${ensure}")

  $visible = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle the Visibility of the Dashboard as a Space in Mission Control':
    user   => $::boxen_user,
    key    => 'dashboard-in-overlay',
    domain => 'com.apple.dock',
    value  => !$visible,
    notify => Exec['killall Dock'],
  }
}
