require 'spec_helper'

describe 'osx::touchpad::gestures::app_expose' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('enabled') do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Toggle the Ability to Swipe for App Expose').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.dock',
        :key    => 'showAppExposeGestureEnabled',
        :value  => 1,
      })
    end
  end

  describe('disabled') do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to 0' do
      should contain_boxen__osx_defaults('Toggle the Ability to Swipe for App Expose').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.dock',
        :key    => 'showAppExposeGestureEnabled',
        :value  => 0,
      })
    end
  end

end
