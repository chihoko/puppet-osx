class osx::firewall($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::firewall([ensure] must be present or absent, is ${ensure}")

  $enabled_value = $ensure ? {
    present => 'on',
    default => 'off'
  }

  $enabled_check = $ensure ? {
    present => 'enabled',
    default => 'disabled'
  }

  include osx::firewall::config

  exec { 'Toggles Whether the Firewall is Enabled':
    command => "${osx::firewall::config::path_to_binary} --setglobalstate ${enabled_value}",
    unless  => "${osx::firewall::config::path_to_binary} --getglobalstate | grep ${enabled_check}",
    user    => root,
  }
}
