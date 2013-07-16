class osx::disk_images::verification($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::disk_images::verification[ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 0,
    default => 1
  }

  boxen::osx_defaults { 'Toggle the Verification of Disk Images - Part 1':
    user   => $::boxen_user,
    domain => 'com.apple.frameworks.diskimages',
    key    => 'skip-verify',
    type   => 'int',
    value  => $enabled_int,
  }

  boxen::osx_defaults { 'Toggle the Verification of Disk Images - Part 2':
    user   => $::boxen_user,
    domain => 'com.apple.frameworks.diskimages',
    key    => 'skip-verify-locked',
    type   => 'int',
    value  => $enabled_int,
  }

  boxen::osx_defaults { 'Toggle the Verification of Disk Images - Part 3':
    user   => $::boxen_user,
    domain => 'com.apple.frameworks.diskimages',
    key    => 'skip-verify-remote',
    type   => 'int',
    value  => $enabled_int,
  }
}
