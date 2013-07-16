class osx::appearance::sidebar_icons(
  $size = undef) {

    validate_re($size, '^(small|medium|large)$', "osx::appearance::sidebar_icons[size] must be one of the following: small, medium, large; is ${size}")

  case $size {
    'small':  { $size_int = 1 }
    'medium': { $size_int = 2 }
    default:  { $size_int = 3 }
  }

  if $size != undef {
    boxen::osx_defaults { 'Set the Size of the Icons in the Sidebar':
      user   => $::boxen_user,
      key    => 'NSTableViewDefaultSizeMode',
      domain => 'NSGlobalDomain',
      value  => $size_int,
    }
  }
}
