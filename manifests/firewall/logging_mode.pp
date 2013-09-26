class osx::firewall::logging_mode($ensure = 'present') {
  include osx::firewall::config

  validate_re($ensure, '^(present|absent)$', "osx::firewall::logging_mode([ensure] must be present or absent, is ${ensure}")

  $enabled_value = $ensure ? {
    present => 'on',
    default => 'off'
  }

  exec { 'Toggle Firewall Logging Mode':
    command => "${osx::firewall::config::path_to_binary} --setloggingmode ${enabled_value}",
    unless  => "${osx::firewall::config::path_to_binary} --getloggingmode | grep ${enabled_value}",
    user    => root,
  }
}
