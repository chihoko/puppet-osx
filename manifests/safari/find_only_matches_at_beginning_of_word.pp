class osx::safari::find_only_matches_at_beginning_of_word($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::safari::find_only_matches_at_beginning_of_word([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether "Find On Page" Matches Only the Beginning of Words':
    user   => $::boxen_user,
    domain => 'com.apple.Safari',
    key    => 'FindOnPageMatchesWordStartsOnly',
    value  => $enabled,
  }
}
