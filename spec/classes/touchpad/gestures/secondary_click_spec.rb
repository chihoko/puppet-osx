require 'spec_helper'

describe 'osx::touchpad::gestures::secondary_click' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('enabled') do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Secondary "Right" Click on Internal Touchpad').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.trackpad.enableSecondaryClick',
        :value  => true,
      })

      should contain_boxen__osx_defaults('Toggle Secondary "Right" Click on External Touchpad').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'TrackpadRightClick',
        :value  => true,
      })

      should contain_boxen__osx_defaults('Toggle Secondary "Right" Click on Magic Mouse').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
        :key    => 'MouseButtonMode',
        :value  => 'TwoButton',
      })
    end
  end

  describe('disabled') do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Secondary "Right" Click on Internal Touchpad').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.trackpad.enableSecondaryClick',
        :value  => false,
      })

      should contain_boxen__osx_defaults('Toggle Secondary "Right" Click on External Touchpad').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'TrackpadRightClick',
        :value  => false,
      })

      should contain_boxen__osx_defaults('Toggle Secondary "Right" Click on Magic Mouse').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
        :key    => 'MouseButtonMode',
        :value  => 'OneButton',
      })
    end
  end

end
