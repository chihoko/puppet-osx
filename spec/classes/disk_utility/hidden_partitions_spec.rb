require 'spec_helper'

describe 'osx::disk_utility::hidden_partitions' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'visible' do
    let(:params) { {:ensure => 'present'} }
    it 'set value to 1' do
      should contain_boxen__osx_defaults('Toggle the Visibility of Hidden Partitions in Disk Utility').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.DiskUtility',
        :key    => 'DUShowEveryPartition',
        :value  => 1,
      })
    end
  end

  describe 'invisible' do
    let(:params) { {:ensure => 'absent'} }
    it 'set value to 0' do
      should contain_boxen__osx_defaults('Toggle the Visibility of Hidden Partitions in Disk Utility').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.DiskUtility',
        :key    => 'DUShowEveryPartition',
        :value  => 0,
      })
    end
  end

end
