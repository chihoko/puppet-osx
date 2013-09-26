require 'spec_helper'

describe 'osx::touchpad::gestures::launchpad' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('enabled') do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle the Ability to Pinch with Thumb and Three Fingers for Launchpad').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.dock',
        :key    => 'showLaunchpadGestureEnabled',
        :value  => true,
      })
    end
  end

  describe('disabled') do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle the Ability to Pinch with Thumb and Three Fingers for Launchpad').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.dock',
        :key    => 'showLaunchpadGestureEnabled',
        :value  => false,
      })
    end
  end

end
