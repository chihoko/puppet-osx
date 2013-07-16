class osx::system::update::local_cdn($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::finder::allow_quit([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether Software Update Prefers the Apple CDN':
    user   => root,
    domain => 'com.apple.SoftwareUpdate',
    key    => '/Library/Preferences/com.apple.SoftwareUpdate',
    value  => $enabled,
  }
}
