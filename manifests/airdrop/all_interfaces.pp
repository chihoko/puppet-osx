#

class osx::airdrop::all_interfaces($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::airdrop::all_interfaces[ensure] must be present or absent, is ${ensure}")

  $allow = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether AirDrop Allows You to "Drop" to Any Interface':
    user   => $::boxen_user,
    key    => 'BrowseAllInterfaces',
    domain => 'com.apple.NetworkBrowser',
    value  => $allow,
  }

}
