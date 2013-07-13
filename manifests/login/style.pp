class osx::login::style($style) {

  case $style {
    'name and password': { $style_code = 1 }
    default:             { $style_code = $style }
  }

  boxen::osx_defaults { 'Set the default login screen style':
    user   => $::boxen_user,
    key    => 'SHOWFULLNAME',
    domain => 'com.apple.loginwindow',
    value  => $style_code,
    notify => Exec['killall SystemUIServer'],
  }
}
