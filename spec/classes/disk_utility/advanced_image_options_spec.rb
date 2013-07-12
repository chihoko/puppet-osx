require 'spec_helper'

describe 'osx::disk_images::verification' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'set value to 0' do
      should contain_boxen__osx_defaults('Toggle the Verification of Disk Images - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.frameworks.diskimages',
        :key    => 'skip-verify',
        :type   => 'int',
        :value  => 0,
      })
      should contain_boxen__osx_defaults('Toggle the Verification of Disk Images - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.frameworks.diskimages',
        :key    => 'skip-verify-locked',
        :type   => 'int',
        :value  => 0,
      })
      should contain_boxen__osx_defaults('Toggle the Verification of Disk Images - Part 3').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.frameworks.diskimages',
        :key    => 'skip-verify-remote',
        :type   => 'int',
        :value  => 0,
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'set value to 1' do
      should contain_boxen__osx_defaults('Toggle the Verification of Disk Images - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.frameworks.diskimages',
        :key    => 'skip-verify',
        :type   => 'int',
        :value  => 1,
      })
      should contain_boxen__osx_defaults('Toggle the Verification of Disk Images - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.frameworks.diskimages',
        :key    => 'skip-verify-locked',
        :type   => 'int',
        :value  => 1,
      })
      should contain_boxen__osx_defaults('Toggle the Verification of Disk Images - Part 3').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.frameworks.diskimages',
        :key    => 'skip-verify-remote',
        :type   => 'int',
        :value  => 1,
      })
    end
  end

end
