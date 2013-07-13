require 'spec_helper'

describe 'osx::keyboard::control_access' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'all_controls_including_dropdowns' do
    let(:params) { {:mode => 'all_controls_including_dropdowns'} }
    it 'should set the value to 3' do
      should contain_boxen__osx_defaults('Set Keyboard Access for Controls').with({
        :domain => 'NSGlobalDomain',
        :key    => 'AppleKeyboardUIMode',
        :type   => 'int',
        :value  => 3,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'all_controls' do
    let(:params) { {:mode => 'all_controls'} }
    it 'should set the value to 2' do
      should contain_boxen__osx_defaults('Set Keyboard Access for Controls').with({
        :domain => 'NSGlobalDomain',
        :key    => 'AppleKeyboardUIMode',
        :type   => 'int',
        :value  => 2,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'basic' do
    let(:params) { {:mode => 'basic'} }
    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Set Keyboard Access for Controls').with({
        :domain => 'NSGlobalDomain',
        :key    => 'AppleKeyboardUIMode',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
    end
  end

end
