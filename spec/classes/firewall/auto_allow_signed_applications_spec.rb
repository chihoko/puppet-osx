require 'spec_helper'

describe 'osx::firewall::auto_allow_signed_applications' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to "on"' do
      should include_class('osx::firewall::config')
      should contain_exec('Toggles Whether Signed Apps are Automatically Allowed to Accept Incoming Connections').with({
        :command => "/usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned on",
        :unless  => "/usr/libexec/ApplicationFirewall/socketfilterfw --getallowsigned | grep ENABLED",
        :user    => 'root',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set the value to "off"' do
      should include_class('osx::firewall::config')
      should contain_exec('Toggles Whether Signed Apps are Automatically Allowed to Accept Incoming Connections').with({
        :command => "/usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off",
        :unless  => "/usr/libexec/ApplicationFirewall/socketfilterfw --getallowsigned | grep DISABLED",
        :user    => 'root',
      })
    end
  end

end
