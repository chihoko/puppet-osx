require 'spec_helper'

describe 'osx::dock::hidden_app_dimming' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set value to true' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Dim hidden apps').with({
        :key    => 'showhidden',
        :domain => 'com.apple.dock',
        :value  => true,
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user]
      })
    end
  end

end
