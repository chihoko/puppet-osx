require 'spec_helper'

describe 'osx::airport::require_password_for_computer_to_computer_networks' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'enabled' do
    let(:params) { {:enabled => true} }

    it 'should enable "Require Password for Computer-to-Computer Networks"' do
      should include_class('osx::airport')
      should contain_exec('Toggle Airport "Require Password for Computer-to-Computer Networks" Preference').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RequireAdminIBSS=YES",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RequireAdminIBSS | grep YES",
        :user    => 'root',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }

    it 'should disable "Require Password for Computer-to-Computer Networks"' do
      should include_class('osx::airport')
      should contain_exec('Toggle Airport "Require Password for Computer-to-Computer Networks" Preference').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RequireAdminIBSS=NO",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RequireAdminIBSS | grep NO",
        :user    => 'root',
      })
    end
  end
end
