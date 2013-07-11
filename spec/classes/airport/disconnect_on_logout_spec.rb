require 'spec_helper'

describe 'osx::airport::disconnect_on_logout' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should run the command with "enabled" set to true' do
      should include_class('osx::airport')
      should contain_exec('Toggle Airport "Disconnect On Logout" Preference').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs DisconnectOnLogout=YES",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs DisconnectOnLogout | grep YES",
        :user    => 'root'
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should run the command with "enabled" set to true' do
      should include_class('osx::airport')
      should contain_exec('Toggle Airport "Disconnect On Logout" Preference').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs DisconnectOnLogout=NO",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs DisconnectOnLogout | grep NO",
        :user    => 'root'
      })
    end
  end
end
