require 'spec_helper'

describe 'osx::finder::posix_title_path' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to "true"' do
      should contain_boxen__osx_defaults('Toggle Whether to Show the Full POSIX Path in the Finder Titlebar').with({
        :domain => 'com.apple.finder',
        :key    => '_FXShowPosixPathInTitle ',
        :value  => true,
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to "false"' do
      should contain_boxen__osx_defaults('Toggle Whether to Show the Full POSIX Path in the Finder Titlebar').with({
        :domain => 'com.apple.finder',
        :key    => '_FXShowPosixPathInTitle ',
        :value  => false,
        :user   => facts[:boxen_user]
      })
    end
  end

end
