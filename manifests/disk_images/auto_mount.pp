class osx::disk_images::auto_mount($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::disk_images::auto_mount([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Toggles Whether the Disk Images are Auto-Mounted - Part 1':
    user   => $::boxen_user,
    domain => 'com.apple.frameworks.diskimages',
    key    => 'auto-open-ro-root',
    type   => 'int',
    value  => $enabled_int,
  }

  boxen::osx_defaults { 'Toggles Whether the Disk Images are Auto-Mounted - Part 2':
    user   => $::boxen_user,
    domain => 'com.apple.frameworks.diskimages',
    key    => 'auto-open-rw-root',
    type   => 'int',
    value  => $enabled_int,
  }

  boxen::osx_defaults { 'Toggles Whether the Disk Images are Auto-Mounted - Part 3':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'OpenWindowForNewRemovableDisk',
    type   => 'int',
    value  => $enabled_int,
  }
}
