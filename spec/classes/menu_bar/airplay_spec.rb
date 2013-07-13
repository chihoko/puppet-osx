require 'spec_helper'

describe 'osx::menu_bar::airplay' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Whether to Show the AirPlay Mirroring Icon in the Menu Bar').with({
        :user   => facts[:boxen_user],
        :key    => 'showInMenuBarIfPresent',
        :domain => 'com.apple.airplay',
        :value  => params[:enabled],
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Whether to Show the AirPlay Mirroring Icon in the Menu Bar').with({
        :user   => facts[:boxen_user],
        :key    => 'showInMenuBarIfPresent',
        :domain => 'com.apple.airplay',
        :value  => params[:enabled],
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

end
