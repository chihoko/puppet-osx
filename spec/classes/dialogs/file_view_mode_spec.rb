require 'spec_helper'

describe 'osx::dialogs::file_view_mode' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  it do
    should include_class('osx::finder')
  end

  describe 'list' do
    let(:params) { {:mode => 'list'} }
    it 'should set value to 2' do
      should contain_boxen__osx_defaults('File Dialog File View Mode - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'NavPanelFileListModeForOpenMode',
        :type   => 'int',
        :value  => 2,
        :notify => 'Exec[killall Finder]',
      })
      should contain_boxen__osx_defaults('File Dialog File View Mode - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'NSNavPanelFileListModeForOpenMode2',
        :type   => 'int',
        :value  => 2,
        :notify => 'Exec[killall Finder]',
      })
      should contain_boxen__osx_defaults('File Dialog File View Mode - Part 3').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'NSNavPanelFileLastListModeForOpenModeKey',
        :type   => 'int',
        :value  => 2,
        :notify => 'Exec[killall Finder]',
      })
      should contain_boxen__osx_defaults('File Dialog File View Mode - Part 4').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'NSNavPanelFileLastListModeForSaveModeKey',
        :type   => 'int',
        :value  => 2,
        :notify => 'Exec[killall Finder]',
      })
      should contain_boxen__osx_defaults('File Dialog File View Mode - Part 5').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'NSNavPanelFileListModeForSaveMode2',
        :type   => 'int',
        :value  => 2,
        :notify => 'Exec[killall Finder]',
      })
      should contain_boxen__osx_defaults('File Dialog File View Mode - Part 6').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'NavPanelFileListModeForSaveMode',
        :type   => 'int',
        :value  => 2,
        :notify => 'Exec[killall Finder]',
      })
    end
  end

end
