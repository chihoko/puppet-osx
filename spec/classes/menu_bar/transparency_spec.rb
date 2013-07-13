require 'spec_helper'

describe 'osx::menu_bar::transparency' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe 'enable' do
    let(:params) { {:enabled => true} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Menu Bar Transparency').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'AppleEnableMenuBarTransparency',
        :value  => params[:enabled],
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

  describe 'disable' do
    let(:params) { {:enabled => false} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Menu Bar Transparency').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'AppleEnableMenuBarTransparency',
        :value  => params[:enabled],
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

end
