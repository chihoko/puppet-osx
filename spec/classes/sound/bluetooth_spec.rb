require 'spec_helper'

describe 'osx::sound::bluetooth' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'set audio_bitpool param' do
    let(:params) { {:audio_bitpool => 4} }
    it 'should set the value to 4' do
      should contain_boxen__osx_defaults('Set the Audio Bitpool for Bluetooth Audio Devices').with({
        :user   => facts[:boxen_user],
        :key    => '"Apple Bitpool Min (editable)"',
        :domain => 'com.apple.BluetoothAudioAgent',
        :value  => params[:audio_bitpool],
      })
    end
  end

end
