class osx::universal_access::flash_screen($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::universal_access::flash_screen([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Toggle Whether the Screen Flashes When an Alert Occurs':
    user   => $::boxen_user,
    domain => 'com.apple.universalaccess',
    key    => 'flashScreen',
    value  => $enabled_int,
  }
}
