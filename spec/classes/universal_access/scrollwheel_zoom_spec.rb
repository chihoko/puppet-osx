require 'spec_helper'

describe 'osx::universal_access::scrollwheel_zoom' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'default' do
    it 'should default to disabled' do
      should contain_boxen__osx_defaults('Use mouse wheel (scroll gesture) to zoom').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.universalaccess',
        :key    => 'closeViewScrollWheelToggle',
        :value  => false,
      })
    end
  end

  describe 'enabled with param' do
    let(:params) { {:ensure => 'present'} }
    it 'should set value to true' do
      should contain_boxen__osx_defaults('Use mouse wheel (scroll gesture) to zoom').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.universalaccess',
        :key    => 'closeViewScrollWheelToggle',
        :value  => true,
      })
    end
  end

  describe 'disabled with param' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set value to false' do
      should contain_boxen__osx_defaults('Use mouse wheel (scroll gesture) to zoom').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.universalaccess',
        :key    => 'closeViewScrollWheelToggle',
        :value  => false,
      })
    end
  end

end
