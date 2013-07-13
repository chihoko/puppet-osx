class osx::dock::magnification(
  $enabled             = undef,
  $magnified_icon_size = undef ) {

  include osx::dock

  case $enabled {
    true:  { $enabled_int = 1 }
    false: { $enabled_int = 0 }
  }

  if $enabled != undef {
    boxen::osx_defaults { 'Toggles Whether the Icons Magnify as the Cursor Gets Closer':
      user   => $::boxen_user,
      key    => 'magnification',
      domain => 'com.apple.dock',
      type   => 'int',
      value  => $enabled_int,
      notify => Exec['killall Dock'],
    }
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
