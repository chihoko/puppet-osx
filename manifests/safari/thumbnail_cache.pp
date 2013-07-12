class osx::safari::thumbnail_cache($enabled) {
  case $enabled {
    true:  { $enabled_int = 2 }
    false: { $enabled_int = 0 }
  }

  boxen::osx_defaults { 'Toggle Whether the Cache for "Top Sites" and "History" is Enabled':
    user   => $::boxen_user,
    domain => 'com.apple.Safari',
    key    => 'DebugSnapshotsUpdatePolicy',
    type   => 'int',
    value  => $enabled_int,
  }
}
