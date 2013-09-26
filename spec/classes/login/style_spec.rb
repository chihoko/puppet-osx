require 'spec_helper'

describe 'osx::login::style' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'name and password' do
    let(:params) { {:style => 'name and password'} }
    it 'should set the value to "SHOWFULLNAME"' do
      should contain_boxen__osx_defaults('Set the default login screen style').with({
        :user   => facts[:boxen_user],
        :key    => 'SHOWFULLNAME',
        :domain => 'com.apple.loginwindow',
        :value  => 1,
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

end
