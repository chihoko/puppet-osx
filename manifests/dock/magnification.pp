class osx::dock::magnification(
  $ensure              = 'present',
  $magnified_icon_size = undef ) {

  include osx::dock

  validate_re($ensure, '^(present|absent)$', "osx::disk_images::auto_mount([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Toggles Whether the Icons Magnify as the Cursor Gets Closer':
    user   => $::boxen_user,
    key    => 'magnification',
    domain => 'com.apple.dock',
    type   => 'int',
    value  => $enabled_int,
    notify => Exec['killall Dock'],
  }

  if $magnified_icon_size != undef {
    boxen::osx_defaults { 'Sets the Size of the Icons in Pixels when the Icon is Magnified':
      user   => $::boxen_user,
      key    => 'largesize',
      domain => 'com.apple.dock',
      type   => 'int',
      value  => $magnified_icon_size,
      notify => Exec['killall Dock'],
    }
  }
}
