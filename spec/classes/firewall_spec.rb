require 'spec_helper'

describe 'osx::firewall' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set value to on' do
      should contain_exec('Toggles Whether the Firewall is Enabled').with({
        :command => "/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on",
        :unless  => "/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate | grep enabled",
        :user    => 'root',
      })

    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set value to off' do
      should contain_exec('Toggles Whether the Firewall is Enabled').with({
        :command => "/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate off",
        :unless  => "/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate | grep disabled",
        :user    => 'root',
      })

    end
  end

end
