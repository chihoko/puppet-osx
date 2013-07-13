require 'spec_helper'

describe 'osx::finder::file_extensions' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'display all' do
    let(:params) { {:display_all => true} }
    it 'should set the value to "true"' do
      should contain_boxen__osx_defaults('Toggle Whether Finder will Always Display All File Extensions').with({
        :domain => 'NSGlobalDomain',
        :key    => 'AppleShowAllExtensions',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end

  describe 'warn on change' do
    let(:params) { {:warn_on_change => true} }
    it 'should set the value to "true"' do
      should contain_boxen__osx_defaults('Toggle the Warning When Changing a File Extension').with({
        :domain => 'com.apple.finder',
        :key    => 'FXEnableExtensionChangeWarning',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end

end
