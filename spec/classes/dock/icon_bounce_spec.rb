require 'spec_helper'

describe 'osx::dock::icon_bounce' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'with $on_app_launch param set to true' do
    let(:params) { {:on_app_launch => true} }
    it 'should set the value to "true"' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Toggle the Bouncing Application Icon on Launch').with({
        :key    => 'launchanim',
        :domain => 'com.apple.dock',
        :value  => true,
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'with $on_app_activity param set to true' do
    let(:params) { {:on_app_activity => true} }
    it 'should set the value to "false"' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Toggle the Bouncing Application Icon on Activity').with({
        :key    => 'no-bouncing',
        :domain => 'com.apple.dock',
        :value  => false,
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user],
      })
    end
  end

end
