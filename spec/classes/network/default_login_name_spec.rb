require 'spec_helper'

describe 'osx::network::default_login_name' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe 'false' do
    let(:params) { {:default_name => false} }
    it 'should remove custom default name setting' do
      should contain_boxen__osx_defaults('Removes Custom Default Name Setting - Part 1').with({
        :ensure => 'absent',
        :user   => facts[:boxen_user],
        :key    => 'UseDefaultName',
        :domain => 'com.apple.NetworkAuthorization',
      })

      should contain_boxen__osx_defaults('Removes Custom Default Name Setting - Part 2').with({
        :ensure => 'absent',
        :user   => facts[:boxen_user],
        :key    => 'DefaultName',
        :domain => 'com.apple.NetworkAuthorization',
      })
    end
  end

  describe 'custom name' do
    let(:params) { {:default_name => 'beeslikeme'} }
    it 'should remove custom default name setting' do
      should contain_boxen__osx_defaults('Set Custom Default Name Setting - Part 1').with({
        :user   => facts[:boxen_user],
        :key    => 'UseDefaultName',
        :domain => 'com.apple.NetworkAuthorization',
        :value  => true,
      })

      should contain_boxen__osx_defaults('Set Custom Default Name Setting - Part 2').with({
        :user   => facts[:boxen_user],
        :key    => 'DefaultName',
        :domain => 'com.apple.NetworkAuthorization',
        :value  => params[:default_name],
      })
    end
  end

end
