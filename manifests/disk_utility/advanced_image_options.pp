class osx::disk_utility::advanced_image_options($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::disk_utility::advanced_image_options[ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Toggle Advanced Image Options in Disk Utility':
    user   => $::boxen_user,
    domain => 'com.apple.DiskUtility',
    key    => 'advanced-image-options',
    value  => $enabled_int,
  }
}
