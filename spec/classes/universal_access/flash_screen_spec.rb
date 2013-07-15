require 'spec_helper'

describe 'osx::universal_access::flash_screen' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'enabled' do
    let(:params) { {:enabled => true } }
    it 'should set value to 1' do
      should contain_boxen__osx_defaults('Toggle Whether the Screen Flashes When an Alert Occurs').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.universalaccess',
        :key    => 'flashScreen',
        :value  => 1,
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false } }
    it 'should set value to 0' do
      should contain_boxen__osx_defaults('Toggle Whether the Screen Flashes When an Alert Occurs').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.universalaccess',
        :key    => 'flashScreen',
        :value  => 0,
      })
    end
  end

end
