class osx::sound::bluetooth($audio_bitpool = 30) {

  if is_integer($audio_bitpool) {
    boxen::osx_defaults { 'Set the Audio Bitpool for Bluetooth Audio Devices':
      user   => $::boxen_user,
      key    => '"Apple Bitpool Min (editable)"',
      domain => 'com.apple.BluetoothAudioAgent',
      value  => $audio_bitpool,
    }
  }
}
