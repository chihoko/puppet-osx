require 'spec_helper'

describe 'osx::menu_bar::transparency' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe 'enable' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Menu Bar Transparency').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'AppleEnableMenuBarTransparency',
        :value  => true,
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

  describe 'disable' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Menu Bar Transparency').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'AppleEnableMenuBarTransparency',
        :value  => false,
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

end
