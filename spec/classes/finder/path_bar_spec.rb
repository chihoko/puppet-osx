require 'spec_helper'

describe 'osx::finder::path_bar' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to "true"' do
      should contain_boxen__osx_defaults('Toggle Whether to Show the Finder Path Bar').with({
        :key    => 'ShowPathbar',
        :domain => 'com.apple.finder',
        :value  => true,
        :notify => 'Exec[killall Finder]',
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to "false"' do
      should contain_boxen__osx_defaults('Toggle Whether to Show the Finder Path Bar').with({
        :key    => 'ShowPathbar',
        :domain => 'com.apple.finder',
        :value  => false,
        :notify => 'Exec[killall Finder]',
        :user   => facts[:boxen_user]
      })
    end
  end

end
