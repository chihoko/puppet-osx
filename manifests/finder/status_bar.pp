class osx::finder::status_bar($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::finder::status_bar([ensure] must be present or absent, is ${ensure}")

  include osx::finder

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether to Show the Finder Status Bar':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'ShowStatusBar',
    value  => $enabled,
    notify => Exec['killall Finder'],
  }
}
