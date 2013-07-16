require 'spec_helper'

describe 'osx::airport::remember_recent_networks' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'default' do
    it 'should enable "Remember Recent Networks"' do
      should include_class('osx::airport')
      should contain_exec('Toggle Airport "Remember Recent Networks" Preference').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RememberRecentNetworks=YES",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RememberRecentNetworks | grep YES",
        :user    => 'root',
      })
    end
  end


  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should enable "Remember Recent Networks"' do
      should include_class('osx::airport')
      should contain_exec('Toggle Airport "Remember Recent Networks" Preference').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RememberRecentNetworks=YES",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RememberRecentNetworks | grep YES",
        :user    => 'root',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should enable "Remember Recent Networks"' do
      should include_class('osx::airport')
      should contain_exec('Toggle Airport "Remember Recent Networks" Preference').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RememberRecentNetworks=NO",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs RememberRecentNetworks | grep NO",
        :user    => 'root',
      })
    end
  end
end
