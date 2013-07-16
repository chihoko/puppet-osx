class osx::menu_bar::transparency($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::menu_bar::transparency([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Menu Bar Transparency':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'AppleEnableMenuBarTransparency',
    value  => $enabled,
    notify => Exec['killall SystemUIServer'],
  }
}
