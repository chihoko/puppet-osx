require 'spec_helper'

describe 'osx::touchpad::gestures::tap_to_click' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('enabled') do
    let(:params) { {:enabled => true} }
    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Toggle the Ability to Tap the Touchpad to Click - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.mouse.tapBehavior',
        :type   => 'int',
        :value  => 1,
      })

      should contain_boxen__osx_defaults('Toggle the Ability to Tap the Touchpad to Click - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'Clicking',
        :type   => 'int',
        :value  => 1,
      })

      should contain_boxen__osx_defaults('Toggle the Ability to Tap the Touchpad to Click - Part 3').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.mouse.tapBehavior',
        :host   => 'currentHost',
        :type   => 'int',
        :value  => 1,
      })
    end
  end

  describe('disabled') do
    let(:params) { {:enabled => false} }
    it 'should set the value to 0' do
      should contain_boxen__osx_defaults('Toggle the Ability to Tap the Touchpad to Click - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.mouse.tapBehavior',
        :type   => 'int',
        :value  => 0,
      })

      should contain_boxen__osx_defaults('Toggle the Ability to Tap the Touchpad to Click - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'Clicking',
        :type   => 'int',
        :value  => 0,
      })

      should contain_boxen__osx_defaults('Toggle the Ability to Tap the Touchpad to Click - Part 3').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.mouse.tapBehavior',
        :host   => 'currentHost',
        :type   => 'int',
        :value  => 0,
      })
    end
  end

end
