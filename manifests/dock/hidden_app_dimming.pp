class osx::dock::hidden_app_dimming($ensure = 'present') {
  include osx::dock

  validate_re($ensure, '^(present|absent)$', "osx::disk_images::auto_mount([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Dim hidden apps':
    user   => $::boxen_user,
    domain => 'com.apple.dock',
    key    => 'showhidden',
    value  => $enabled,
    notify => Exec['killall Dock'],
  }
}
