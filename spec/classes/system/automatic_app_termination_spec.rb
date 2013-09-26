require 'spec_helper'

describe 'osx::system::automatic_app_termination' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('enabled') do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Whether to Quit Apps Which Have Been Idle').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'NSDisableAutomaticTermination',
        :value  => false,
      })
    end
  end

  describe('disabled') do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Whether to Quit Apps Which Have Been Idle').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'NSDisableAutomaticTermination',
        :value  => true,
      })
    end
  end

end
