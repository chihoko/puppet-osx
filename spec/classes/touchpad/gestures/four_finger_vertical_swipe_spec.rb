require 'spec_helper'

describe 'osx::touchpad::gestures::four_finger_vertical_swipe' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('disable') do
    let(:params) { {:effect => 'disable'} }
    it 'should set the value to 0' do
      should contain_boxen__osx_defaults('Sets the Effect for Swiping Up/Down with Four Fingers - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'TrackpadFourFingerVertSwipeGesture',
        :value  => 0,
      })

      should contain_boxen__osx_defaults('Sets the Effect for Swiping Up/Down with Four Fingers - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.trackpad.fourFingerVertSwipeGesture',
        :host   => 'currentHost',
        :value  => 0,
      })
    end
  end

  describe('mission control') do
    let(:params) { {:effect => 'mission control'} }
    it 'should set the value to 2' do
      should contain_boxen__osx_defaults('Sets the Effect for Swiping Up/Down with Four Fingers - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'TrackpadFourFingerVertSwipeGesture',
        :value  => 2,
      })

      should contain_boxen__osx_defaults('Sets the Effect for Swiping Up/Down with Four Fingers - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.trackpad.fourFingerVertSwipeGesture',
        :host   => 'currentHost',
        :value  => 2,
      })
    end
  end

end
