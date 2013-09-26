# TODO: Let the user pass in readable values
#
class osx::finder::default_location($location = 'home directory') {

  validate_re($location, '^(home directory)$', "osx::finder::default_location([location] must be present or absent, is ${location}")

  $location_code = $location ? {
    'home directory' => 'PfHm',
    default          => 'PfHm'
  }

  boxen::osx_defaults { 'Set the Default Location Used When Opening a New Window in Finder':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'NewWindowTarget',
    value  => $location_code,
  }
}
