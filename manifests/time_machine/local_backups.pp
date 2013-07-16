class osx::time_machine::local_backups($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::time_machine::local_backups([ensure] must be present or absent, is ${ensure}")

  $enabled_text = $ensure ? {
    present => 'enable',
    default => 'disable'
  }

  $enabled_check = $ensure ? {
    present => 'grep -E  "Kind\s+:\s+Local"',
    default => 'grep -LE "Kind\s+:\s+Local"'
  }

  exec { 'Toggle Whether Local Time Machine Backups are Enabled':
    command => "tmutil ${enabled_text}local",
    onlyif  => "hash tmutil &> /dev/null && tmutil destinationinfo | ${enabled_check}",
    user    => root,
  }
}
