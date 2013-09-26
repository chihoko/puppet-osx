class osx::dock::style($style = '3D') {
  include osx::dock

  validate_re($style, '^(3D|2D)$', "osx::disk_images::auto_mount([style] must be 3D or 2D, is ${style}")

  $style_mode = $style ? {
    '3D'    => false,
    default => true
  }

  boxen::osx_defaults { 'Set the Style of the Dock':
    user   => $::boxen_user,
    key    => 'no-glass',
    domain => 'com.apple.dock',
    value  => $style_mode,
    notify => Exec['killall Dock'],
  }
}
