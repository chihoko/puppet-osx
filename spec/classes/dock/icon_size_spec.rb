require 'spec_helper'

describe 'osx::dock::icon_size' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'with icon size set to 36' do
    let(:params) { {:size => 36} }
    it 'should set the value to "36"' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Sets the Size of the Icons in Pixels').with({
        :key    => 'tilesize',
        :domain => 'com.apple.dock',
        :type   => 'int',
        :value  => 36,
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user],
      })
    end
  end

end
