class osx::firewall::auto_allow_signed_applications($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::firewall::auto_allow_signed_applications([ensure] must be present or absent, is ${ensure}")

  $enabled_value = $ensure ? {
    'present' => 'on',
    default => 'off'
  }

  $enabled_check = $ensure ? {
    'present' => 'ENABLED',
    default => 'DISABLED'
  }

  include osx::firewall::config

  exec { 'Toggles Whether Signed Apps are Automatically Allowed to Accept Incoming Connections':
    command => "${osx::firewall::config::path_to_binary} --setallowsigned ${enabled_value}",
    unless  => "${osx::firewall::config::path_to_binary} --getallowsigned | grep ${enabled_check}",
    user    => root,
  }
}
