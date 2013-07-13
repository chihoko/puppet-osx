require 'spec_helper'

describe 'osx::keyboard::accented_press_and_hold' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to "true"' do
      should contain_boxen__osx_defaults('Press-and-Hold for Accented Characters').with({
        :domain => 'NSGlobalDomain',
        :key    => 'ApplePressAndHoldEnabled',
        :value  => true,
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set the value to "false"' do
      should contain_boxen__osx_defaults('Press-and-Hold for Accented Characters').with({
        :domain => 'NSGlobalDomain',
        :key    => 'ApplePressAndHoldEnabled',
        :value  => false,
        :user   => facts[:boxen_user]
      })
    end
  end

end
