class osx::network::guest($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::network::guest([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggles Whether to Allow Guest Access to Shared Folders - Part 1':
    user   => root,
    key    => 'guestAccess',
    domain => '/Library/Preferences/com.apple.AppleFileServer',
    value  => $enabled,
  }

  boxen::osx_defaults { 'Toggles Whether to Allow Guest Access to Shared Folders - Part 2':
    user   => root,
    key    => 'AllowGuestAccess',
    domain => '/Library/Preferences/com.apple.smb.server',
    value  => $enabled,
  }
}
