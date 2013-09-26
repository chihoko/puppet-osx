class osx::network::dsstores($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::network::dsstores([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle the Creation of .DS_Store Files on Network Volumes':
    user   => $::boxen_user,
    domain => 'com.apple.desktopservices',
    key    => 'DSDontWriteNetworkStores',
    value  => !$enabled,
  }
}
