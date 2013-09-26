class osx::dock::icon_bounce(
  $on_app_launch   = undef,
  $on_app_activity = undef ) {

  include osx::dock

  if $on_app_launch != undef {
    validate_bool($on_app_launch)
    boxen::osx_defaults { 'Toggle the Bouncing Application Icon on Launch':
      user   => $::boxen_user,
      key    => 'launchanim',
      domain => 'com.apple.dock',
      value  => $on_app_launch,
      notify => Exec['killall Dock'];
    }
  }

  if $on_app_activity != undef {
    validate_bool($on_app_activity)
    boxen::osx_defaults { 'Toggle the Bouncing Application Icon on Activity':
      user   => $::boxen_user,
      key    => 'no-bouncing',
      domain => 'com.apple.dock',
      value  => !$on_app_activity,
      notify => Exec['killall Dock'];
    }
  }
}
