require 'spec_helper'

describe 'osx::mission_control::dashboard_visibility' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe 'visible' do
    let(:params) { {:visible => true} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle the Visibility of the Dashboard as a Space in Mission Control').with({
        :user   => facts[:boxen_user],
        :key    => 'dashboard-in-overlay',
        :domain => 'com.apple.dock',
        :value  => !params[:visible],
      })
    end
  end

  describe 'visible' do
    let(:params) { {:visible => false} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle the Visibility of the Dashboard as a Space in Mission Control').with({
        :user   => facts[:boxen_user],
        :key    => 'dashboard-in-overlay',
        :domain => 'com.apple.dock',
        :value  => !params[:visible],
      })
    end
  end

end
