# TODO: Let the user pass in readable values
#
class osx::finder::default_search_scope($scope = 'current folder') {

  validate_re($scope, '^(current folder)$', "osx::finder::default_search_scope([scope] must be present or absent, is ${scope}")

  $scope_code = $scope ? {
    'current folder' => 'SCcf',
    default          => 'SCcf'
  }

  boxen::osx_defaults { 'Set the Default Scope Used When Using The Search Box in Finder':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'FXDefaultSearchScope',
    value  => $scope_code,
    notify => Exec['killall Finder'],
  }
}
