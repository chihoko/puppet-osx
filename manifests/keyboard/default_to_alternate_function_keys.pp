class osx::keyboard::default_to_alternate_function_keys($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::finder::allow_quit([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Default to "Alernate" Function Keys When Not Holding the "fn" Key':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.keyboard.fnState',
    value  => $enabled,
  }
}
