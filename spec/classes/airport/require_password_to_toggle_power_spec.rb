require 'spec_helper'

describe 'osx::airport::require_password_to_toggle_power' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should run the command with "enabled" set to true' do
      should include_class('osx::airport')
      should contain_exec('Toggle Airport "Require Password to Turn Wi-Fi On or Off" Preference').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RequireAdminPowerToggle=YES",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RequireAdminPowerToggle | grep YES",
        :user    => 'root'
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should run the command with "enabled" set to false' do
      should include_class('osx::airport')
      should contain_exec('Toggle Airport "Require Password to Turn Wi-Fi On or Off" Preference').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RequireAdminPowerToggle=NO",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RequireAdminPowerToggle | grep NO",
        :user    => 'root'
      })
    end
  end

end
