class osx::disk_utility::hidden_partitions($visible) {

  case $visible {
    true:  { $visible_int = 1 }
    false: { $visible_int = 0 }
  }

  boxen::osx_defaults { 'Toggle the Visibility of Hidden Partitions in Disk Utility':
    user   => $::boxen_user,
    domain => 'com.apple.DiskUtility',
    key    => 'DUShowEveryPartition',
    value  => $visible_int,
  }
}
