class osx::login::retries_before_hint($attempts = 5) {
  boxen::osx_defaults { 'Number of Attempts Before Password Hint is Shown':
    user   => root,
    key    => 'RetriesUntilHint',
    domain => '/Library/Preferences/com.apple.loginwindow',
    type   => 'int',
    value  => $attempts,
    notify => Exec['killall SystemUIServer'],
  }
}
