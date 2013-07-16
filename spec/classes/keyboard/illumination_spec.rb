require 'spec_helper'

describe 'osx::keyboard::illumination' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Whether Keyboard Illuminates').with({
        :domain => 'com.apple.BezelServices',
        :key    => 'kDim',
        :value  => true,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Whether Keyboard Illuminates').with({
        :domain => 'com.apple.BezelServices',
        :key    => 'kDim',
        :value  => false,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'auto_dim enabled' do
    let(:params) { {:auto_dim => true} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Keyboard Illumination Brightness Changes Depending on Ambient Light').with({
        :domain => 'com.apple.BezelServices',
        :key    => 'dAuto',
        :value  => true,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'auto_dim disabled' do
    let(:params) { {:auto_dim => false} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Keyboard Illumination Brightness Changes Depending on Ambient Light').with({
        :domain => 'com.apple.BezelServices',
        :key    => 'dAuto',
        :value  => false,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'auto_off_delay' do
    let(:params) { {:auto_off_delay => 5} }
    it 'should set the value to 5' do
      should contain_boxen__osx_defaults('Set Idle Time Before Keyboard Illumination Turns Off').with({
        :domain => 'com.apple.BezelServices',
        :key    => 'kDimTime',
        :type   => 'int',
        :value  => 5,
        :user   => facts[:boxen_user],
      })
    end
  end

end
