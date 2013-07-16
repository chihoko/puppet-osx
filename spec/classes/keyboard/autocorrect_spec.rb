require 'spec_helper'

describe 'osx::keyboard::autocorrect' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to "true"' do
      should contain_boxen__osx_defaults('Toggle Auto-Correct').with({
        :domain => 'NSGlobalDomain',
        :key    => 'NSAutomaticSpellingCorrectionEnabled',
        :value  => true,
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to "false"' do
      should contain_boxen__osx_defaults('Toggle Auto-Correct').with({
        :domain => 'NSGlobalDomain',
        :key    => 'NSAutomaticSpellingCorrectionEnabled',
        :value  => false,
        :user   => facts[:boxen_user]
      })
    end
  end

end
