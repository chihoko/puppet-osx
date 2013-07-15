require 'spec_helper'

describe 'osx::dashboard' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set value to true' do
      should contain_boxen__osx_defaults('Toggle Whether Dashboard is Enabled').with({
        :user   => facts[:boxen_user],
        :key    => 'mcx-disabled',
        :domain => 'com.apple.dashboard',
        :value  => params[:enabled],
        :notify => 'Exec[killall Dashboard]',
      })

      should contain_exec('killall Dashboard').with({
        :refreshonly => true,
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set value to false' do
      should contain_boxen__osx_defaults('Toggle Whether Dashboard is Enabled').with({
        :user   => facts[:boxen_user],
        :key    => 'mcx-disabled',
        :domain => 'com.apple.dashboard',
        :value  => params[:enabled],
        :notify => 'Exec[killall Dashboard]',
      })

      should contain_exec('killall Dashboard').with({
        :refreshonly => true,
      })
    end
  end

end
