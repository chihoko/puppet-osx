class osx::dock::itunes_notifications($ensure = 'present') {
  include osx::dock

  validate_re($ensure, '^(present|absent)$', "osx::disk_images::auto_mount([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Display iTunes Notifications on the Dock':
    user   => $::boxen_user,
    key    => 'itunes-notifications',
    domain => 'com.apple.dock',
    value  => $enabled,
    notify => Exec['killall Dock'];
  }
}
