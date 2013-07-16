class osx::firewall::stealth_mode($ensure = 'present') {
  include osx::firewall::config

  validate_re($ensure, '^(present|absent)$', "osx::finder::allow_quit([ensure] must be present or absent, is ${ensure}")

  $enabled_value = $ensure ? {
    present => 'on',
    default => 'off'
  }

  $enabled_check = $ensure ? {
    present => 'enabled',
    default => 'disabled'
  }

  exec { 'Toggles Whether the Firewall Responds to Innocuous Requests like PING':
    command => "${osx::Firewall::config::path_to_binary} --setstealthmode ${enabled_value}",
    unless  => "${osx::Firewall::config::path_to_binary} --getstealthmode | grep ${enabled_check}",
    user    => root,
  }
}
