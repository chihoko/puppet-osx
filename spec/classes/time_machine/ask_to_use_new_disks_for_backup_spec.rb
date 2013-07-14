require 'spec_helper'

describe 'osx::time_machine::ask_to_use_new_disks_for_backup' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('enabled') do
    let(:params) { {:enabled => true} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Whether Time Machine Asks to Use New Disks for Backup').with({
        :user   => facts[:boxen_user],
        :key    => 'DoNotOfferNewDisksForBackup',
        :domain => 'com.apple.TimeMachine',
        :value  => params[:enabled],
      })
    end
  end

  describe('disabled') do
    let(:params) { {:enabled => false} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Whether Time Machine Asks to Use New Disks for Backup').with({
        :user   => facts[:boxen_user],
        :key    => 'DoNotOfferNewDisksForBackup',
        :domain => 'com.apple.TimeMachine',
        :value  => params[:enabled],
      })
    end
  end

end
