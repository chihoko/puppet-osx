require 'spec_helper'

describe 'osx::dock::only_show_running_apps' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'defaults' do
    it 'should set the value to "true"' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Toggles Whether to Only Show Running Application in the Dock').with({
        :key    => 'static-only',
        :domain => 'com.apple.dock',
        :value  => true,
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to "true"' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Toggles Whether to Only Show Running Application in the Dock').with({
        :key    => 'static-only',
        :domain => 'com.apple.dock',
        :value  => true,
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user]
      })
    end
  end

end
