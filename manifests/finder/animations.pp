class osx::finder::animations($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::finder::animations([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => false,
    default => true
  }

  boxen::osx_defaults { 'Toggle Whether to Enable Finder Animations':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'DisableAllAnimations',
    value  => $enabled,
  }
}
