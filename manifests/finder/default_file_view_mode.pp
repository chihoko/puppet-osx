# TODO: Let the user pass in readable values
#

# Values: Nlsv, icnv, clmv, or Flwv

class osx::finder::default_file_view_mode($mode = 'list') {
  include osx::finder

  validate_re($mode, '^(icons|list|columns|cover_flow)$', "osx::finder::default_file_view_mode([mode] must be oneof the following: icons, list, columns, cover_flow; is ${mode}")

  $mode_code = $mode ? {
    'icons'      => 'icnv',
    'list'       => 'Nlsv',
    'columns'    => 'clmv',
    'cover_flow' => 'Flwv',
    default      => 'Nlsv'
  }

  boxen::osx_defaults { 'Set the File View Mode Used By Default When Opening New Finder Windows':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'FXPreferredViewStyle',
    value  => $mode_code,
    notify => [
      Exec['killall Finder'],
      #Exec['Remove All .DS_Store Files'],
    ]
  }
}
