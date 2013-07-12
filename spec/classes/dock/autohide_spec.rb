require 'spec_helper'

describe 'osx::dock::autohide' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to "true"' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Automatically hide the dock').with({
        :key    => 'autohide',
        :domain => 'com.apple.dock',
        :value  => true,
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'delay set' do
    let(:params) { {:delay => 0} }
    it 'should set the value to 0' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Set the delay when auto-hiding the dock - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.dock',
        :key    => 'autohide-delay',
        :type   => 'float',
        :value  => 0,
        :notify => 'Exec[killall Dock]',
      })
      should contain_boxen__osx_defaults('Set the delay when auto-hiding the dock - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.dock',
        :key    => 'autohide-time-modifier',
        :type   => 'float',
        :value  => 0,
        :notify => 'Exec[killall Dock]',
      })
    end
  end

end
