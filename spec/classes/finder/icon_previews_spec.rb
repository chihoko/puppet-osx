require 'spec_helper'

describe 'osx::finder::icon_previews' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should run the list of execs' do
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:IconViewSettings:showIconPreview true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:ListViewSettings:showIconPreview true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:ExtendedListViewSettings:showIconPreview true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:IconViewSettings:showIconPreview true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:ListViewSettings:showIconPreview true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:ExtendedListViewSettings:showIconPreview true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:IconViewSettings:showIconPreview true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:ListViewSettings:showIconPreview true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:ExtendedListViewSettings:showIconPreview true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
    end

    it 'should remove all existing icon previews' do
      should contain_boxen__osx_defaults('Remove All Existing Icon Previews').with({
        :key    => 'FXRecentFolders',
        :domain => 'com.apple.finder',
        :type   => 'array',
        :value  => '()',
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should run the list of execs' do
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:IconViewSettings:showIconPreview false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:ListViewSettings:showIconPreview false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:ExtendedListViewSettings:showIconPreview false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:IconViewSettings:showIconPreview false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:ListViewSettings:showIconPreview false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:ExtendedListViewSettings:showIconPreview false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:IconViewSettings:showIconPreview false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:ListViewSettings:showIconPreview false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:ExtendedListViewSettings:showIconPreview false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]',
          'Exec[Remove All Existing Icon Previews]',
        ],
      })
    end

    it 'should remove all existing icon previews' do
      should contain_boxen__osx_defaults('Remove All Existing Icon Previews').with({
        :key    => 'FXRecentFolders',
        :domain => 'com.apple.finder',
        :type   => 'array',
        :value  => '()',
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end

end
