class osx::finder::posix_title_path($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::finder::posix_title_path([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether to Show the Full POSIX Path in the Finder Titlebar':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => '_FXShowPosixPathInTitle ',
    value  => $enabled,
  }
}
