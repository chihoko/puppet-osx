require 'spec_helper'

describe 'osx::finder::icon_arrangement' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  let(:params) { {:style     => 'grid'} }

  it 'should run the list of execs' do
    should contain_exec("/usr/libexec/plistbuddy -c 'Set :DesktopViewSettings:IconViewSettings:arrangeBy grid' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
      :notify => [
        'Exec[killall Finder]',
        'Exec[Remove All .DS_Store Files]',
      ]
    })

    should contain_exec("/usr/libexec/plistbuddy -c 'Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
      :notify => [
        'Exec[killall Finder]',
        'Exec[Remove All .DS_Store Files]',
      ]
    })

    should contain_exec("/usr/libexec/plistbuddy -c 'Set :StandardViewSettings:IconViewSettings:arrangeBy grid' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
      :notify => [
        'Exec[killall Finder]',
        'Exec[Remove All .DS_Store Files]',
      ]
    })

    should contain_exec("/usr/libexec/plistbuddy -c 'Set :ComputerViewSettings:IconViewSettings:arrangeBy grid' /Users/ilikebees/Library/Preferences/com.apple.finder.plist").with({
      :notify => [
        'Exec[killall Finder]',
        'Exec[Remove All .DS_Store Files]',
      ]
    })

  end

end
