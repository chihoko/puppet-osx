class osx::security::system_preference_lock($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::finder::allow_quit([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  exec { "/usr/libexec/plistbuddy -c 'Set :rights:system.preferences:shared ${enabled}' /etc/authorization":
    unless => "/usr/libexec/plistbuddy -c 'Print :rights:system.preferences:shared' /etc/authorization | grep ${enabled}",
    user   => root,
  }
}
