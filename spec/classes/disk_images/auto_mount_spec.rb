require 'spec_helper'

describe 'osx::disk_images::auto_mount' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'set value to 1' do
      should contain_boxen__osx_defaults('Toggles Whether the Disk Images are Auto-Mounted - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.frameworks.diskimages',
        :key    => 'auto-open-ro-root',
        :type   => 'int',
        :value  => 1,
      })
      should contain_boxen__osx_defaults('Toggles Whether the Disk Images are Auto-Mounted - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.frameworks.diskimages',
        :key    => 'auto-open-rw-root',
        :type   => 'int',
        :value  => 1,
      })
      should contain_boxen__osx_defaults('Toggles Whether the Disk Images are Auto-Mounted - Part 3').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.finder',
        :key    => 'OpenWindowForNewRemovableDisk',
        :type   => 'int',
        :value  => 1,
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'set value to 0' do
      should contain_boxen__osx_defaults('Toggles Whether the Disk Images are Auto-Mounted - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.frameworks.diskimages',
        :key    => 'auto-open-ro-root',
        :type   => 'int',
        :value  => 0,
      })
      should contain_boxen__osx_defaults('Toggles Whether the Disk Images are Auto-Mounted - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.frameworks.diskimages',
        :key    => 'auto-open-rw-root',
        :type   => 'int',
        :value  => 0,
      })
      should contain_boxen__osx_defaults('Toggles Whether the Disk Images are Auto-Mounted - Part 3').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.finder',
        :key    => 'OpenWindowForNewRemovableDisk',
        :type   => 'int',
        :value  => 0,
      })
    end
  end

end
