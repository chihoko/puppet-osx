require 'spec_helper'

describe 'osx::login::guest' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Toggles Whether to Allow the Guest Account to Login').with({
        :user   => 'root',
        :key    => 'GuestEnabled',
        :domain => '/Library/Preferences/com.apple.loginwindow',
        :value  => 1,
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to 0' do
      should contain_boxen__osx_defaults('Toggles Whether to Allow the Guest Account to Login').with({
        :user   => 'root',
        :key    => 'GuestEnabled',
        :domain => '/Library/Preferences/com.apple.loginwindow',
        :value  => 0,
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

end
