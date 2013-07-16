class osx::mission_control::group_by_app($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::mission_control::group_by_app([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether Multiple Windows for an App are Grouped Together in Mission Control':
    user   => $::boxen_user,
    key    => 'expose-group-by-app',
    domain => 'com.apple.dock',
    value  => $enabled,
  }
}
