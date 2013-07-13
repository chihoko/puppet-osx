require 'spec_helper'

describe 'osx::login::auto_login' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggles Whether to Automatically Login a User').with({
        :user   => 'root',
        :key    => 'autoLoginUser',
        :domain => '/Library/Preferences/com.apple.loginwindow',
        :value  => params[:enabled],
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggles Whether to Automatically Login a User').with({
        :user   => 'root',
        :key    => 'autoLoginUser',
        :domain => '/Library/Preferences/com.apple.loginwindow',
        :value  => params[:enabled],
        :notify => 'Exec[killall SystemUIServer]',
      })
    end

    it 'should remove the resource' do
      should contain_file('/etc/kcpassword').with({
        :ensure => 'absent',
      })
    end
  end

end
