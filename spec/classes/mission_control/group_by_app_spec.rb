require 'spec_helper'

describe 'osx::mission_control::group_by_app' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Whether Multiple Windows for an App are Grouped Together in Mission Control').with({
        :user   => facts[:boxen_user],
        :key    => 'expose-group-by-app',
        :domain => 'com.apple.dock',
        :value  => true,
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Whether Multiple Windows for an App are Grouped Together in Mission Control').with({
        :user   => facts[:boxen_user],
        :key    => 'expose-group-by-app',
        :domain => 'com.apple.dock',
        :value  => false,
      })
    end
  end

end
