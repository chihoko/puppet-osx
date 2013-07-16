class osx::system::save_windows_on_quit($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::system::save_windows_on_quit([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether to Save Windows and Positions when Restarting/Quitting - Part 1':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'NSQuitAlwaysKeepsWindows',
    value  => $enabled,
  }

  boxen::osx_defaults { 'Toggle Whether to Save Windows and Positions when Restarting/Quitting - Part 2':
    user   => $::boxen_user,
    domain => 'com.apple.loginwindow',
    key    => 'LoginwindowLaunchesRelaunchApps',
    value  => $enabled,
  }

  boxen::osx_defaults { 'Toggle Whether to Save Windows and Positions when Restarting/Quitting - Part 3':
    user   => $::boxen_user,
    domain => 'com.apple.loginwindow',
    key    => 'TALLogoutSavesState',
    value  => $enabled,
  }
}
