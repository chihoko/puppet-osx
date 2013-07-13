require 'spec_helper'

describe 'osx::finder::icon_previews' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should run the list of execs'
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
    let(:params) { {:enabled => false} }
    it 'should run the list of execs'
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
