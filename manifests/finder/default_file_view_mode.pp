# TODO: Let the user pass in readable values
#

# Values: Nlsv, icnv, clmv, or Flwv

class osx::finder::default_file_view_mode($mode = 'list') {
  include osx::finder

  validate_re($mode, '^(list|icons)$', "osx::finder::default_file_view_mode([mode] must be oneof the following: list, icons; is ${mode}")

  $mode_code = $mode ? {
    'list'  => 'Nlsv',
    default => 'Nlsv'
  }

  boxen::osx_defaults { 'Set the File View Mode Used By Default When Opening New Finder Windows':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'FXPreferredViewStyle',
    value  => $mode_code,
    notify => [
      Exec['killall Finder'],
      Exec['Remove All .DS_Store Files'],
    ]
  }
}
