class osx::dock::only_show_running_apps($ensure = 'present') {
  include osx::dock

  validate_re($ensure, '^(present|absent)$', "osx::disk_images::auto_mount([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggles Whether to Only Show Running Application in the Dock':
    user   => $::boxen_user,
    domain => 'com.apple.dock',
    key    => 'static-only',
    value  => $enabled,
    notify => Exec['killall Dock'],
  }
}
