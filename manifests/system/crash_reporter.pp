class osx::system::crash_reporter($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::system::crash_reporter([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle the Dialog to Sent Usage Statistics to Apple - Part 1':
    user   => $::boxen_user,
    key    => 'DialogType',
    domain => 'com.apple.CrashReporter',
    value  => $enabled;
  }

  boxen::osx_defaults { 'Toggle the Dialog to Sent Usage Statistics to Apple - Part 2':
    user   => $::boxen_user,
    key    => 'AutoSubmit',
    host   => 'currentHost',
    domain => 'com.apple.SubmitDiagInfo',
    value  => $enabled;
  }
}
