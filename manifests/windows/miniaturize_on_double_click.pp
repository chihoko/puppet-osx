class osx::windows::miniaturize_on_double_click($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::windows::miniaturize_on_double_click([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Miniaturize Windows on Double-Click':
    user   => $::boxen_user,
    key    => 'AppleMiniaturizeOnDoubleClick',
    domain => 'NSGlobalDomain',
    type   => 'int',
    value  => $enabled_int,
  }
}
