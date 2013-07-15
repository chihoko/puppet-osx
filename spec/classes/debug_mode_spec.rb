require 'spec_helper'

describe 'osx::debug_mode' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set value to true' do
      should contain_boxen__osx_defaults('Toggle Disk Utility Debug Mode').with({
        :user   => facts[:boxen_user],
        :key    => 'DUDebugMenuEnabled',
        :domain => 'com.apple.DiskUtility',
        :value  => params[:enabled],
      })

      should contain_boxen__osx_defaults('Toggle Address Book Debug Mode').with({
        :user   => facts[:boxen_user],
        :key    => 'ABShowDebugMenu',
        :domain => 'com.apple.addressbook',
        :value  => params[:enabled],
      })

      should contain_boxen__osx_defaults('Toggle Safari Debug Mode').with({
        :user   => facts[:boxen_user],
        :key    => 'IncludeInternalDebugMenu',
        :domain => 'com.apple.Safari',
        :value  => params[:enabled],
      })

      should contain_boxen__osx_defaults('Toggle App Store Debug Mode - Part 1').with({
        :user   => facts[:boxen_user],
        :key    => 'ShowDebugMenu',
        :domain => 'com.apple.appstore',
        :value  => params[:enabled],
      })

      should contain_boxen__osx_defaults('Toggle App Store Debug Mode - Part 2').with({
        :user   => facts[:boxen_user],
        :key    => 'WebKitDeveloperExtras',
        :domain => 'com.apple.appstore',
        :value  => params[:enabled],
      })

      should contain_boxen__osx_defaults('Toggle Help Viewer Debug Mode').with({
        :user   => facts[:boxen_user],
        :key    => 'DevMode',
        :domain => 'com.apple.helpviewer',
        :value  => params[:enabled],
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set value to false' do
      should contain_boxen__osx_defaults('Toggle Disk Utility Debug Mode').with({
        :user   => facts[:boxen_user],
        :key    => 'DUDebugMenuEnabled',
        :domain => 'com.apple.DiskUtility',
        :value  => params[:enabled],
      })

      should contain_boxen__osx_defaults('Toggle Address Book Debug Mode').with({
        :user   => facts[:boxen_user],
        :key    => 'ABShowDebugMenu',
        :domain => 'com.apple.addressbook',
        :value  => params[:enabled],
      })

      should contain_boxen__osx_defaults('Toggle Safari Debug Mode').with({
        :user   => facts[:boxen_user],
        :key    => 'IncludeInternalDebugMenu',
        :domain => 'com.apple.Safari',
        :value  => params[:enabled],
      })

      should contain_boxen__osx_defaults('Toggle App Store Debug Mode - Part 1').with({
        :user   => facts[:boxen_user],
        :key    => 'ShowDebugMenu',
        :domain => 'com.apple.appstore',
        :value  => params[:enabled],
      })

      should contain_boxen__osx_defaults('Toggle App Store Debug Mode - Part 2').with({
        :user   => facts[:boxen_user],
        :key    => 'WebKitDeveloperExtras',
        :domain => 'com.apple.appstore',
        :value  => params[:enabled],
      })

      should contain_boxen__osx_defaults('Toggle Help Viewer Debug Mode').with({
        :user   => facts[:boxen_user],
        :key    => 'DevMode',
        :domain => 'com.apple.helpviewer',
        :value  => params[:enabled],
      })
    end
  end

end
