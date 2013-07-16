class osx::system::automatic_app_termination($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::system::automatic_app_termination([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether to Quit Apps Which Have Been Idle':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'NSDisableAutomaticTermination',
    value  => !$enabled,
  }
}
