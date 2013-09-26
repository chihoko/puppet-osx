# Public: Enable use of mousewheel for zooming.
class osx::universal_access::scrollwheel_zoom($ensure = 'absent') {

  validate_re($ensure, '^(present|absent)$', "osx::universal_access::scrollwheel_zoom([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Use mouse wheel (scroll gesture) to zoom':
    user   => $::boxen_user,
    domain => 'com.apple.universalaccess',
    key    => 'closeViewScrollWheelToggle',
    value  => $enabled,
  }
}
