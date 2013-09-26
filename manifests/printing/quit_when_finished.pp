class osx::printing::quit_when_finished($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::printing::quit_when_finished([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether the Print Dialog Should Disappear When All Jobs Are Complete':
    user   => $::boxen_user,
    key    => '"Quit When Finished"',
    domain => 'com.apple.print.PrintingPrefs',
    value  => $enabled,
  }
}
