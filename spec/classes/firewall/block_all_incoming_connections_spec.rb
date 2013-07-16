require 'spec_helper'

describe 'osx::firewall::block_all_incoming_connections' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to "on"' do
      should include_class('osx::firewall::config')
      should contain_exec('Toggle Whether the Firewall Blocks All Non-Essential Incoming Connections').with({
        :command => "/usr/libexec/ApplicationFirewall/socketfilterfw --setblockall on",
        :unless  => "/usr/libexec/ApplicationFirewall/socketfilterfw --getblockall | grep on",
        :user    => 'root',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to "off"' do
      should include_class('osx::firewall::config')
      should contain_exec('Toggle Whether the Firewall Blocks All Non-Essential Incoming Connections').with({
        :command => "/usr/libexec/ApplicationFirewall/socketfilterfw --setblockall off",
        :unless  => "/usr/libexec/ApplicationFirewall/socketfilterfw --getblockall | grep off",
        :user    => 'root',
      })
    end
  end

end
