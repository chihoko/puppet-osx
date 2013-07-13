require 'spec_helper'

describe 'osx::firewall::logging_mode' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to "on"' do
      should include_class('osx::firewall::config')
      should contain_exec('Toggle Firewall Logging Mode').with({
        :command => "/usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on",
        :unless  => "/usr/libexec/ApplicationFirewall/socketfilterfw --getloggingmode | grep on",
        :user    => 'root',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set the value to "off"' do
      should include_class('osx::firewall::config')
      should contain_exec('Toggle Firewall Logging Mode').with({
        :command => "/usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode off",
        :unless  => "/usr/libexec/ApplicationFirewall/socketfilterfw --getloggingmode | grep off",
        :user    => 'root',
      })
    end
  end

end
