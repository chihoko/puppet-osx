require 'spec_helper'

describe 'osx::keyboard::default_to_alternate_function_keys' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to "true"' do
      should contain_boxen__osx_defaults('Default to "Alernate" Function Keys When Not Holding the "fn" Key').with({
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.keyboard.fnState',
        :value  => true,
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to "false"' do
      should contain_boxen__osx_defaults('Default to "Alernate" Function Keys When Not Holding the "fn" Key').with({
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.keyboard.fnState',
        :value  => false,
        :user   => facts[:boxen_user]
      })
    end
  end

end
