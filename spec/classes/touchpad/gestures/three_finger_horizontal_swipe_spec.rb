require 'spec_helper'

describe 'osx::touchpad::gestures::three_finger_horizontal_swipe' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('switch pages') do
    let(:params) { {:effect => 'switch pages'} }
    it 'should set the value to 1' do
      should include_class('osx::touchpad::gestures::page_swiping')

      should contain_boxen__osx_defaults('Sets the Effect for Swiping Left/Right with Three Fingers - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'TrackpadThreeFingerHorizSwipeGesture',
        :value  => 1,
      })
      
      should contain_boxen__osx_defaults('Sets the Effect for Swiping Left/Right with Three Fingers - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.trackpad.threeFingerHorizSwipeGesture',
        :host   => 'currentHost',
        :value  => 1,
      })
    end
  end

  describe('switch apps') do
    let(:params) { {:effect => 'switch apps'} }
    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Sets the Effect for Swiping Left/Right with Three Fingers - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'TrackpadThreeFingerHorizSwipeGesture',
        :value  => 2,
      })
      
      should contain_boxen__osx_defaults('Sets the Effect for Swiping Left/Right with Three Fingers - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.trackpad.threeFingerHorizSwipeGesture',
        :host   => 'currentHost',
        :value  => 2,
      })
    end
  end

end
