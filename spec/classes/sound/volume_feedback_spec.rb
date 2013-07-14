require 'spec_helper'

describe 'osx::sound::volume_feedback' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe('enabled') do
    let(:params) { {:enabled => true} }
    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Toggle Volume Feedback Sound').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.sound.beep.feedback',
        :type   => 'int',
        :value  => 1,
      })
    end
  end

  describe('disabled') do
    let(:params) { {:enabled => false} }
    it 'should set the value to 0' do
      should contain_boxen__osx_defaults('Toggle Volume Feedback Sound').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.sound.beep.feedback',
        :type   => 'int',
        :value  => 0,
      })
    end
  end

end
