class osx::gatekeeper($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::gatekeeper([ensure] must be present or absent, is ${ensure}")

  $enabled_text = $ensure ? {
    present => 'enable',
    default => 'disable'
  }

  exec { 'Toggles Whether to Restart Automatically if System Hangs':
    command => "spctl --master-${enabled_text}",
    user    => root,
  }
}
