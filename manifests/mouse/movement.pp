class osx::mouse::movement(
  $scaling         = undef,
  $scrolling_speed = undef) {

  if $scaling != undef {
    boxen::osx_defaults { 'Sets the Speed With Which Mouse Movement Moves the Cursor':
      user   => $::boxen_user,
      domain => 'NSGlobalDomain',
      key    => 'com.apple.mouse.scaling',
      type   => 'float',
      value  => $scaling,
    }
  }

  if $scrolling_speed != undef {
    boxen::osx_defaults { 'Sets the Speed With Which the Mouse Scrolls Content':
      user   => $::boxen_user,
      domain => 'NSGlobalDomain',
      key    => 'com.apple.scrollwheel.scaling',
      type   => 'float',
      value  => $scrolling_speed,
    }
  }
}
