class osx::time_machine::unsupported_network_volumes($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::time_machine::unsupported_network_volumes([ensure] must be present or absent, is ${ensure}")

  $allow = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether Unsupported Network Volumes are Displayed in Time Machine':
    user   => $::boxen_user,
    key    => 'TMShowUnsupportedNetworkVolumes',
    domain => 'com.apple.systempreferences',
    value  => $allow,
  }
}
