# TODO add more styles

class osx::login::style($style = 'name and password') {

  validate_re($style, '^(name and password)$', "osx::login::style([ensure] must be one of the following: name and password, is ${style}")

  $style_code = $style ? {
    'name and password' => 1,
    default => 1
  }

  boxen::osx_defaults { 'Set the default login screen style':
    user   => $::boxen_user,
    key    => 'SHOWFULLNAME',
    domain => 'com.apple.loginwindow',
    value  => $style_code,
    notify => Exec['killall SystemUIServer'],
  }
}
