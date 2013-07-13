require 'spec_helper'

describe 'osx::dock::magnification' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to 1' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Toggles Whether the Icons Magnify as the Cursor Gets Closer').with({
        :user   => facts[:boxen_user],
        :key    => 'magnification',
        :domain => 'com.apple.dock',
        :type   => 'int',
        :value  => 1,
        :notify => 'Exec[killall Dock]',
      })
    end
  end

  describe 'with magnified_icon_size set' do
    let(:params) { {:magnified_icon_size => 48} }
    it 'should set the value to 48' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Sets the Size of the Icons in Pixels when the Icon is Magnified').with({
        :key    => 'largesize',
        :type   => 'int',
        :value  => 48,
        :domain => 'com.apple.dock',
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user],
      })
    end
  end

end
