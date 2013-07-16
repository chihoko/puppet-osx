require 'spec_helper'

describe 'osx::dock::itunes_notifications' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to "true"' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Display iTunes Notifications on the Dock').with({
        :key    => 'itunes-notifications',
        :domain => 'com.apple.dock',
        :value  => true,
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user]
      })
    end
  end

end
