require 'spec_helper'

describe 'osx::finder::springing' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to "true"' do
      should contain_boxen__osx_defaults('Toggles Whether Springing is Enabled').with({
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.springing.enabled',
        :value  => true,
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set the value to "false"' do
      should contain_boxen__osx_defaults('Toggles Whether Springing is Enabled').with({
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.springing.enabled',
        :value  => false,
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'delay set to 0' do
    let(:params) { {:delay => 0} }
    it 'should set the value to 0' do
      should contain_boxen__osx_defaults('Sets the Delay Before a Hovered Item "Springs"').with({
        :domain => 'NSGlobalDomain',
        :value  => 0,
        :user   => facts[:boxen_user],
        :key    => 'com.apple.springing.delay',
        :type   => 'float',
      })
    end
  end

end
