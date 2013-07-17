# TODO: Add the rest of the frequencies

class osx::system::update::schedule($frequency = 'daily') {


  validate_re($frequency, '^(daily)$', "osx::system::update::schedule([ensure] must be daily; is ${frequency}")

  $frequency_int = $frequency ? {
    'daily' => 1,
    default => 1
  }

  boxen::osx_defaults { 'Sets the Interval Between Software Update Checks':
    user   => root,
    domain => '/Library/Preferences/com.apple.SoftwareUpdate',
    key    => 'ScheduleFrequency',
    type   => 'int',
    value  => $frequency_int,
  }
}
