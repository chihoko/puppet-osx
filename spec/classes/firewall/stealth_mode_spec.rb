require 'spec_helper'

describe 'osx::firewall::stealth_mode' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to "on"' do
      should include_class('osx::firewall::config')
      should contain_exec('Toggles Whether the Firewall Responds to Innocuous Requests like PING').with({
        :command => "/usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on",
        :unless  => "/usr/libexec/ApplicationFirewall/socketfilterfw --getstealthmode | grep enabled",
        :user    => 'root',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to "off"' do
      should include_class('osx::firewall::config')
      should contain_exec('Toggles Whether the Firewall Responds to Innocuous Requests like PING').with({
        :command => "/usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode off",
        :unless  => "/usr/libexec/ApplicationFirewall/socketfilterfw --getstealthmode | grep disabled",
        :user    => 'root',
      })
    end
  end

end
