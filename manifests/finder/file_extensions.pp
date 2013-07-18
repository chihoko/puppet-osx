class osx::finder::file_extensions(
  $display_all    = undef,
  $warn_on_change = undef) {

  include osx::finder

  if $display_all != undef {
    validate_bool($display_all)
    boxen::osx_defaults { 'Toggle Whether Finder will Always Display All File Extensions':
      user   => $::boxen_user,
      domain => 'NSGlobalDomain',
      key    => 'AppleShowAllExtensions',
      value  => $display_all,
      notify => Exec['killall Finder'],
    }
  }

  if $warn_on_change != undef {
    validate_bool($warn_on_change)
    boxen::osx_defaults { 'Toggle the Warning When Changing a File Extension':
      user   => $::boxen_user,
      domain => 'com.apple.finder',
      key    => 'FXEnableExtensionChangeWarning',
      value  => $warn_on_change,
      notify => Exec['killall Finder'],
    }
  }
}
