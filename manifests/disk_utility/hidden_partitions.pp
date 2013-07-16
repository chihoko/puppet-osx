class osx::disk_utility::hidden_partitions($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::disk_images::hidden_partitions([ensure] must be present or absent, is ${ensure}")

  $visible_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Toggle the Visibility of Hidden Partitions in Disk Utility':
    user   => $::boxen_user,
    domain => 'com.apple.DiskUtility',
    key    => 'DUShowEveryPartition',
    value  => $visible_int,
  }
}
