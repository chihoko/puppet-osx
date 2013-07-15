class osx::sound::ui(
  $level   = undef,
  $enabled = undef) {

  case $enabled {
    true:  { $enabled_int = 1 }
    false: { $enabled_int = 0 }
  }

  if $enabled_int != undef {
    boxen::osx_defaults { 'Toggle UI Sound Effects':
      user   => $::boxen_user,
      key    => 'com.apple.sound.uiaudio.enabled',
      domain => 'com.apple.systemsound',
      type   => 'int',
      value  => $enabled_int,
    }
  }

  if $level != undef {
    boxen::osx_defaults { 'Toggle UI Sound Effects Volume':
      user   => $::boxen_user,
      key    => 'com.apple.sound.beep.volume',
      domain => 'com.apple.systemsound',
      type   => 'float',
      value  => $level,
    }
  }
}
