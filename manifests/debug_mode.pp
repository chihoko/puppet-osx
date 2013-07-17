class osx::debug_mode($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::debug_mode([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Disk Utility Debug Mode':
    user   => $::boxen_user,
    key    => 'DUDebugMenuEnabled',
    domain => 'com.apple.DiskUtility',
    value  => $enabled,
  }

  boxen::osx_defaults { 'Toggle Address Book Debug Mode':
    user   => $::boxen_user,
    key    => 'ABShowDebugMenu',
    domain => 'com.apple.addressbook',
    value  => $enabled,
  }

  boxen::osx_defaults { 'Toggle Safari Debug Mode':
    user   => $::boxen_user,
    key    => 'IncludeInternalDebugMenu',
    domain => 'com.apple.Safari',
    value  => $enabled,
  }

  boxen::osx_defaults { 'Toggle App Store Debug Mode - Part 1':
    user   => $::boxen_user,
    key    => 'ShowDebugMenu',
    domain => 'com.apple.appstore',
    value  => $enabled,
  }

  boxen::osx_defaults { 'Toggle App Store Debug Mode - Part 2':
    user   => $::boxen_user,
    key    => 'WebKitDeveloperExtras',
    domain => 'com.apple.appstore',
    value  => $enabled,
  }

  boxen::osx_defaults { 'Toggle Help Viewer Debug Mode':
    user   => $::boxen_user,
    key    => 'DevMode',
    domain => 'com.apple.helpviewer',
    value  => $enabled,
  }
}
