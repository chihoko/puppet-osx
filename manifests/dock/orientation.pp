class osx::dock::orientation($orientation = 'bottom') {
  include osx::dock

  validate_re($orientation, '^(top|right|bottom|left)$', "osx::dock::orientation([orientation] must be one of the following: top, right, bottom, left, is ${orientation}")

  boxen::osx_defaults { 'Set the Position of the Dock Relative to the Desktop':
    user   => $::boxen_user,
    key    => 'orientation',
    domain => 'com.apple.dock',
    value  => $orientation,
    notify => Exec['killall Dock'];
  }
}
