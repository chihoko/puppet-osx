class osx::universal_access::assistive_device_access($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::universal_access::assistive_device_access([ensure] must be present or absent, is ${ensure}")

  file { '/private/var/db/.AccessibilityAPIEnabled':
    ensure  => $ensure,
    content => 'a',
    owner   => root,
    group   => 'wheel',
    mode    => 0444,
  }
}
