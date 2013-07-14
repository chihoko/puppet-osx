require 'spec_helper'

describe 'osx::system::automatic_app_termination' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('enabled') do
    let(:params) { {:enabled => true} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Whether to Quit Apps Which Have Been Idle').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'NSDisableAutomaticTermination',
        :value  => !params[:enabled],
      })
    end
  end

  describe('disabled') do
    let(:params) { {:enabled => false} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Whether to Quit Apps Which Have Been Idle').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'NSDisableAutomaticTermination',
        :value  => !params[:enabled],
      })
    end
  end

end
