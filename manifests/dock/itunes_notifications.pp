class osx::dock::itunes_notifications($enabled) {
  include osx::dock

  boxen::osx_defaults { 'Display iTunes Notifications on the Dock':
    user   => $::boxen_user,
    key    => 'itunes-notifications',
    domain => 'com.apple.dock',
    value  => $enabled,
    notify => Exec['killall Dock'];
  }
}
