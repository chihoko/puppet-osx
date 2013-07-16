class osx::finder::path_bar($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::finder::path_bar(([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether to Show the Finder Path Bar':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'ShowPathbar',
    value  => $enabled,
    notify => Exec['killall Finder'],
  }
}
