require 'spec_helper'

describe 'osx::system::crash_reporter' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('enabled') do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle the Dialog to Sent Usage Statistics to Apple - Part 1').with({
        :user   => facts[:boxen_user],
        :key    => 'DialogType',
        :domain => 'com.apple.CrashReporter',
        :value  => true,
      })

      should contain_boxen__osx_defaults('Toggle the Dialog to Sent Usage Statistics to Apple - Part 2').with({
        :user   => facts[:boxen_user],
        :key    => 'AutoSubmit',
        :host   => 'currentHost',
        :domain => 'com.apple.SubmitDiagInfo',
        :value  => true,
      })
    end
  end

  describe('disabled') do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle the Dialog to Sent Usage Statistics to Apple - Part 1').with({
        :user   => facts[:boxen_user],
        :key    => 'DialogType',
        :domain => 'com.apple.CrashReporter',
        :value  => false,
      })

      should contain_boxen__osx_defaults('Toggle the Dialog to Sent Usage Statistics to Apple - Part 2').with({
        :user   => facts[:boxen_user],
        :key    => 'AutoSubmit',
        :host   => 'currentHost',
        :domain => 'com.apple.SubmitDiagInfo',
        :value  => false,
      })
    end
  end

end
