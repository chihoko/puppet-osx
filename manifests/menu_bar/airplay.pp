class osx::menu_bar::airplay($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::menu_bar::airplay([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether to Show the AirPlay Mirroring Icon in the Menu Bar':
    user   => $::boxen_user,
    key    => 'showInMenuBarIfPresent',
    domain => 'com.apple.airplay',
    value  => $enabled,
    notify => Exec['killall SystemUIServer'],
  }
}
