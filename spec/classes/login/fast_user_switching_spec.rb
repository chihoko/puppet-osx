require 'spec_helper'

describe 'osx::login::fast_user_switching' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggles Whether Allow Fast User Switching').with({
        :user   => 'root',
        :key    => 'MultipleSessionEnabled',
        :domain => '/Library/Preferences/.GlobalPreferences',
        :value  => params[:enabled],
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggles Whether Allow Fast User Switching').with({
        :user   => 'root',
        :key    => 'MultipleSessionEnabled',
        :domain => '/Library/Preferences/.GlobalPreferences',
        :value  => params[:enabled],
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

end
