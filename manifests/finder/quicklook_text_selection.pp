class osx::finder::quicklook_text_selection($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::finder::quicklook_text_selection([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether You Can Select Text in a QuickLook Window':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'QLEnableTextSelection',
    value  => $enabled,
  }
}
