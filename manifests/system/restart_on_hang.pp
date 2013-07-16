class osx::system::restart_on_hang($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::finder::allow_quit([ensure] must be present or absent, is ${ensure}")

  $enabled_text = $ensure ? {
    present => 'on',
    default => 'off'
  }

  $enabled_check = $ensure ? {
    present => 'On',
    default => 'Off'
  }

  exec { 'Toggles Whether to Restart Automatically if System Hangs':
    command => "systemsetup -setrestartfreeze ${enabled_text}",
    unless  => "systemsetup -getrestartfreeze ${enabled_check}",
    user    => root,
  }
}
