class osx::displays::auto_brightness_adjustment($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::displays::auto_brightness_adjustment([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Toggle Whether Brightness is Automatically Adjusted Depending on Ambient Light':
    user   => root,
    key    => '"Automatic Display Enabled"',
    domain => '/Library/Preferences/com.apple.iokit.AmbientLightSensor',
    type   => 'int',
    value  => $enabled_int,
  }
}
