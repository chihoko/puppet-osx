require 'spec_helper'

describe 'osx::touchpad::gestures::four_finger_horizontal_swipe' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('disable') do
    let(:params) { {:effect => 'disabled'} }
    it 'should set the value to 0' do
      should contain_boxen__osx_defaults('Sets the Effect for Swiping Left/Right with Four Fingers - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'TrackpadFourFingerHorizSwipeGesture',
        :value  => 0,
      })

      should contain_boxen__osx_defaults('Sets the Effect for Swiping Left/Right with Four Fingers - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.trackpad.fourFingerHorizSwipeGesture',
        :host   => 'currentHost',
        :value  => 0,
      })
    end
  end

  describe('switch apps') do
    let(:params) { {:effect => 'switch apps'} }
    it 'should set the value to 2' do
      should contain_boxen__osx_defaults('Sets the Effect for Swiping Left/Right with Four Fingers - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'TrackpadFourFingerHorizSwipeGesture',
        :value  => 2,
      })

      should contain_boxen__osx_defaults('Sets the Effect for Swiping Left/Right with Four Fingers - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.trackpad.fourFingerHorizSwipeGesture',
        :host   => 'currentHost',
        :value  => 2,
      })
    end
  end

end
