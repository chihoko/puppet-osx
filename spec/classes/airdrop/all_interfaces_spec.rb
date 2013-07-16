require 'spec_helper'

describe 'osx::airdrop::all_interfaces' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'defaults' do
    it 'should set the value to true' do

      should contain_boxen__osx_defaults('Toggle Whether AirDrop Allows You to "Drop" to Any Interface').with({
        :user   => facts[:boxen_user],
        :key    => 'BrowseAllInterfaces',
        :domain => 'com.apple.NetworkBrowser',
        :value  => true,
      })
    end
  end

  describe 'with $ensure set to "present"' do
    let(:params) { {:ensure => 'present'} }

    it 'should set the value to true' do

      should contain_boxen__osx_defaults('Toggle Whether AirDrop Allows You to "Drop" to Any Interface').with({
        :user   => facts[:boxen_user],
        :key    => 'BrowseAllInterfaces',
        :domain => 'com.apple.NetworkBrowser',
        :value  => true,
      })
    end
  end

  describe 'with $allow set to "false"' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set the value to "true"' do

      should contain_boxen__osx_defaults('Toggle Whether AirDrop Allows You to "Drop" to Any Interface').with({
        :user   => facts[:boxen_user],
        :key    => 'BrowseAllInterfaces',
        :domain => 'com.apple.NetworkBrowser',
        :value  => false,
      })
    end
  end

end
