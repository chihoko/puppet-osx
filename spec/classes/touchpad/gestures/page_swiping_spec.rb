require 'spec_helper'

describe 'osx::touchpad::gestures::page_swiping' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('enabled') do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Toggle the Ability to Swipe to Switch Pages').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'AppleEnableSwipeNavigateWithScrolls',
        :value  => 1,
      })
    end
  end

  describe('disabled') do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to 0' do
      should contain_boxen__osx_defaults('Toggle the Ability to Swipe to Switch Pages').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'AppleEnableSwipeNavigateWithScrolls',
        :value  => 0,
      })
    end
  end

end
