class osx::airport::join_mode_fallback($mode) {
  include osx::airport

  # Modes: Prompt | JoinOpen | KeepLooking | DoNothing
  validate_re($mode, '^(Prompt|JoinOpen|KeepLooking|DoNothing)$', "osx::airdrop::join_mode_fallback[mode] must be one of the following: Prompt, JoinOpen, KeepLooking, DoNothing; is ${mode}")

  exec { 'Set What to Do When None of the Preferred Networks Are Available':
    command => "${osx::airport::path_to_binary} prefs JoinModeFallback=${mode}",
    unless  => "${osx::airport::path_to_binary} prefs JoinModeFallback | grep ${mode}",
    user    => root,
  }
}
