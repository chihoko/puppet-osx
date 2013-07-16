class osx::dialogs::auto_expanding_print_dialog($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::dialogs::auto_expanding_print_dialog[ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Expand print panel by default - Part 1':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'PMPrintingExpandedStateForPrint',
    value  => $enabled,
  }

  boxen::osx_defaults { 'Expand print panel by default - Part 2':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'PMPrintingExpandedStateForPrint2',
    value  => $enabled,
  }
}
