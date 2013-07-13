# TODO: Let the user pass in readable values
#

# Values: Nlsv, icnv, clmv, or Flwv

class osx::finder::default_file_view_mode($mode) {
  include osx::finder

  case $mode {
    'list':  { $mode_code = 'Nlsv' }
    default: { $mode_code = $mode }
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
