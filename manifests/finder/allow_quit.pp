class osx::finder::allow_quit($ensure = 'present') {

  include osx::finder

  validate_re($ensure, '^(present|absent)$', "osx::finder::allow_quit([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle the Ability to Quit Finder':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'QuitMenuItem',
    value  => $enabled,
    notify => Exec['killall Finder'],
  }
}
