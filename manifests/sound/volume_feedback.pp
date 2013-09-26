class osx::sound::volume_feedback($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::finder::allow_quit([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'Toggle Volume Feedback Sound':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.sound.beep.feedback',
    type   => 'int',
    value  => $enabled_int,
  }
}
