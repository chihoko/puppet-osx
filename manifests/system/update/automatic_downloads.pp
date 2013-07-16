class osx::system::update::automatic_downloads($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::system::update::automatic_downloads([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }


  boxen::osx_defaults { 'Toggle Whether Software Updates are Downloaded in the Background when Available':
    user   => root,
    domain => 'AutomaticDownload',
    key    => '/Library/Preferences/com.apple.SoftwareUpdate',
    value  => $enabled,
  }
}
