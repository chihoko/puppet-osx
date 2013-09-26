require 'spec_helper'

describe 'osx::network::dsstores' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle the Creation of .DS_Store Files on Network Volumes').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.desktopservices',
        :key    => 'DSDontWriteNetworkStores',
        :value  => false,
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle the Creation of .DS_Store Files on Network Volumes').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.desktopservices',
        :key    => 'DSDontWriteNetworkStores',
        :value  => true,
      })
    end
  end

end
