require 'spec_helper'

describe 'osx::displays::auto_brightness_adjustment' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'set value to 1' do
      should contain_boxen__osx_defaults('Toggle Whether Brightness is Automatically Adjusted Depending on Ambient Light').with({
        :user   => 'root',
        :key    => '"Automatic Display Enabled"',
        :domain => '/Library/Preferences/com.apple.iokit.AmbientLightSensor',
        :type   => 'int',
        :value  => 1,
      })
    end
  end

  describe 'enabled' do
    let(:params) { {:enabled => false} }
    it 'set value to 0' do
      should contain_boxen__osx_defaults('Toggle Whether Brightness is Automatically Adjusted Depending on Ambient Light').with({
        :user   => 'root',
        :key    => '"Automatic Display Enabled"',
        :domain => '/Library/Preferences/com.apple.iokit.AmbientLightSensor',
        :type   => 'int',
        :value  => 0,
      })
    end
  end

end
