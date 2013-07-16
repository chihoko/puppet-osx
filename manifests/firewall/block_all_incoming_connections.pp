class osx::firewall::block_all_incoming_connections($ensure = 'present') {
  include osx::firewall::config

  validate_re($ensure, '^(present|absent)$', "osx::finder::allow_quit([ensure] must be present or absent, is ${ensure}")

  $enabled_value = $ensure ? {
    present => 'on',
    default => 'off'
  }

  exec { 'Toggle Whether the Firewall Blocks All Non-Essential Incoming Connections':
    command => "${osx::firewall::config::path_to_binary} --setblockall ${enabled_value}",
    unless  => "${osx::firewall::config::path_to_binary} --getblockall | grep ${enabled_value}",
    user    => root,
  }
}
