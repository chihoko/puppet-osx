require 'spec_helper'

describe 'osx::sound::ui' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe('enabled') do
    let(:params) { {:enabled => true} }
    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Toggle UI Sound Effects').with({
        :user   => facts[:boxen_user],
        :key    => 'com.apple.sound.uiaudio.enabled',
        :domain => 'com.apple.systemsound',
        :type   => 'int',
        :value  => 1,
      })
    end
  end

  describe('with level set') do
    let(:params) { {:level => 5} }
    it 'should set the value to 5' do
      should contain_boxen__osx_defaults('Toggle UI Sound Effects Volume').with({
        :user   => facts[:boxen_user],
        :key    => 'com.apple.sound.beep.volume',
        :domain => 'com.apple.systemsound',
        :type   => 'float',
        :value  => 5,
      })
    end
  end

end
