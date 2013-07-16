class osx::safari::thumbnail_cache($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::safari::thumbnail_cache([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 2,
    default => 0
  }

  boxen::osx_defaults { 'Toggle Whether the Cache for "Top Sites" and "History" is Enabled':
    user   => $::boxen_user,
    domain => 'com.apple.Safari',
    key    => 'DebugSnapshotsUpdatePolicy',
    type   => 'int',
    value  => $enabled_int,
  }
}
