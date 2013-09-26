class osx::windows::scroll_bars($style = 'Automatic') {

  validate_re($style, '^(Automatic|Manual)$', "osx::windows::scroll_bars([style] must be present or absent, is ${style}")

  boxen::osx_defaults { 'Sets the Scrollbar Mode':
    user   => $::boxen_user,
    key    => 'AppleShowScrollBars',
    domain => 'NSGlobalDomain',
    value  => $style,
  }
}
