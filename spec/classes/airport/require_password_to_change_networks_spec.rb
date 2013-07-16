require 'spec_helper'

describe 'osx::airport::require_password_to_change_networks' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should run the command with "ensure" set to "present"' do
      should include_class('osx::airport')
      should contain_exec('Toggle Airport "Require Password to Change Networks" Preference').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RequireAdminNetworkChange=YES",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RequireAdminNetworkChange | grep YES",
        :user    => 'root'
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should run the command with "ensure" set to "absent"' do
      should include_class('osx::airport')
      should contain_exec('Toggle Airport "Require Password to Change Networks" Preference').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RequireAdminNetworkChange=NO",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RequireAdminNetworkChange | grep NO",
        :user    => 'root'
      })
    end
  end

end
