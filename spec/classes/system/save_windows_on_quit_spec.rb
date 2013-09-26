require 'spec_helper'

describe 'osx::system::save_windows_on_quit' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('enabled') do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Whether to Save Windows and Positions when Restarting/Quitting - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'NSQuitAlwaysKeepsWindows',
        :value  => true,
      })

      should contain_boxen__osx_defaults('Toggle Whether to Save Windows and Positions when Restarting/Quitting - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.loginwindow',
        :key    => 'LoginwindowLaunchesRelaunchApps',
        :value  => true,
      })

      should contain_boxen__osx_defaults('Toggle Whether to Save Windows and Positions when Restarting/Quitting - Part 3').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.loginwindow',
        :key    => 'TALLogoutSavesState',
        :value  => true,
      })
    end
  end

  describe('disabled') do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Whether to Save Windows and Positions when Restarting/Quitting - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'NSQuitAlwaysKeepsWindows',
        :value  => false,
      })

      should contain_boxen__osx_defaults('Toggle Whether to Save Windows and Positions when Restarting/Quitting - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.loginwindow',
        :key    => 'LoginwindowLaunchesRelaunchApps',
        :value  => false,
      })

      should contain_boxen__osx_defaults('Toggle Whether to Save Windows and Positions when Restarting/Quitting - Part 3').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.loginwindow',
        :key    => 'TALLogoutSavesState',
        :value  => false,
      })
    end
  end

end
