require 'spec_helper'

describe 'osx::itunes::automatic_device_backup_when_syncing' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to "false"' do
      should contain_boxen__osx_defaults('Toggle Whether iTunes Automatically Backs Up Device on Sync').with({
        :key    => 'AutomaticDeviceBackupsDisabled',
        :domain => 'com.apple.iTunes',
        :value  => false,
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set the value to "true"' do
      should contain_boxen__osx_defaults('Toggle Whether iTunes Automatically Backs Up Device on Sync').with({
        :key    => 'AutomaticDeviceBackupsDisabled',
        :domain => 'com.apple.iTunes',
        :value  => true,
        :user   => facts[:boxen_user]
      })
    end
  end

end
