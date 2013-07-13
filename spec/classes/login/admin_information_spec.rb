require 'spec_helper'

describe 'osx::login::admin_information' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to "Hostname"' do
      should contain_boxen__osx_defaults('Show Admin Information when Clicking the Clock on the Login Screen').with({
        :user   => 'root',
        :key    => 'AdminHostInfo',
        :domain => '/Library/Preferences/com.apple.loginwindow',
        :value  => 'HostName',
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should remove the resource' do
      should contain_boxen__osx_defaults('Do not Show Admin Information when Clicking the Clock on the Login Screen').with({
        :ensure => 'absent',
        :user   => 'root',
        :key    => 'AdminHostInfo',
        :domain => '/Library/Preferences/com.apple.loginwindow',
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

end
