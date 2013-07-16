require 'spec_helper'

describe 'osx::screensaver::password_protection' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Toggles Whether or not a Password is Required to Disable the Screensaver').with({
        :user   => facts[:boxen_user],
        :key    => 'askForPassword',
        :domain => 'com.apple.screensaver',
        :value  => 1,
      })
    end
  end

  describe 'delay' do
    let(:params) { {:delay => 0} }
    it 'should set the delay to 0' do
      should contain_boxen__osx_defaults('Set the Delay Before a Password is Required').with({
        :user   => facts[:boxen_user],
        :key    => 'askForPasswordDelay',
        :domain => 'com.apple.screensaver',
        :value  => 0,
      })
    end
  end

end
