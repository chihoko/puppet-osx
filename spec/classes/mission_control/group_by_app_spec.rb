require 'spec_helper'

describe 'osx::mission_control::group_by_app' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Whether Multiple Windows for an App are Grouped Together in Mission Control').with({
        :user   => facts[:boxen_user],
        :key    => 'expose-group-by-app',
        :domain => 'com.apple.dock',
        :value  => params[:enabled],
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Whether Multiple Windows for an App are Grouped Together in Mission Control').with({
        :user   => facts[:boxen_user],
        :key    => 'expose-group-by-app',
        :domain => 'com.apple.dock',
        :value  => params[:enabled],
      })
    end
  end

end
