require 'spec_helper'

describe 'osx::finder::animations' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to "true"' do
      should contain_boxen__osx_defaults('Toggle Whether to Enable Finder Animations').with({
        :key    => 'DisableAllAnimations',
        :domain => 'com.apple.finder',
        :value  => false,
        :user   => facts[:boxen_user]
      })
    end
  end

end
