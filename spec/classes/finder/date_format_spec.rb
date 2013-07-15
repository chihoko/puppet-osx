require 'spec_helper'

describe 'osx::finder::date_format' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'relative' do
    let(:params) { {:format => 'relative'} }
    it 'should run the command with $format_bool set to true' do
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:ListViewSettings:useRelativeDates true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [ 'Exec[killall Finder]',
                     'Exec[Remove All .DS_Store Files]', ]
      })

      should contain_exec("/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:ExtendedListViewSettings:useRelativeDates true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [ 'Exec[killall Finder]',
                     'Exec[Remove All .DS_Store Files]', ]
      })

      should contain_exec("/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:ListViewSettings:useRelativeDates true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [ 'Exec[killall Finder]',
                     'Exec[Remove All .DS_Store Files]', ]
      })

      should contain_exec("/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:ExtendedListViewSettings:useRelativeDates true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [ 'Exec[killall Finder]',
                     'Exec[Remove All .DS_Store Files]', ]
      })

      should contain_exec("/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:ListViewSettings:useRelativeDates true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [ 'Exec[killall Finder]',
                     'Exec[Remove All .DS_Store Files]', ]
      })

      should contain_exec("/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:ExtendedListViewSettings:useRelativeDates true' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [ 'Exec[killall Finder]',
                     'Exec[Remove All .DS_Store Files]', ]
      })
    end
  end
  describe 'absolute' do
    let(:params) { {:format => 'absolute'} }
    it 'should run the command with $format_bool set to false' do
      should contain_exec("/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:ListViewSettings:useRelativeDates false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [ 'Exec[killall Finder]',
                     'Exec[Remove All .DS_Store Files]', ]
      })

      should contain_exec("/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:ExtendedListViewSettings:useRelativeDates false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [ 'Exec[killall Finder]',
                     'Exec[Remove All .DS_Store Files]', ]
      })

      should contain_exec("/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:ListViewSettings:useRelativeDates false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [ 'Exec[killall Finder]',
                     'Exec[Remove All .DS_Store Files]', ]
      })

      should contain_exec("/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:ExtendedListViewSettings:useRelativeDates false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [ 'Exec[killall Finder]',
                     'Exec[Remove All .DS_Store Files]', ]
      })

      should contain_exec("/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:ListViewSettings:useRelativeDates false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [ 'Exec[killall Finder]',
                     'Exec[Remove All .DS_Store Files]', ]
      })

      should contain_exec("/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:ExtendedListViewSettings:useRelativeDates false' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
        :notify => [ 'Exec[killall Finder]',
                     'Exec[Remove All .DS_Store Files]', ]
      })
    end
  end

end
