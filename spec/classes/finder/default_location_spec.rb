require 'spec_helper'

describe 'osx::finder::default_location' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'home directory' do
    let(:params) { {:location => 'home directory'} }
    it 'should set the value to "PfHm"' do
      should contain_boxen__osx_defaults('Set the Default Location Used When Opening a New Window in Finder').with({
        :key    => 'NewWindowTarget',
        :domain => 'com.apple.finder',
        :value  => 'PfHm',
        :user   => facts[:boxen_user],
      })
    end
  end

end
