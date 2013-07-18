require 'spec_helper'

describe 'osx::finder::default_search_scope' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::finder')
  end

  describe 'current folder' do
    let(:params) { {:scope => 'current folder'} }
    it 'should set the value to "SCcf"' do
      should contain_boxen__osx_defaults('Set the Default Scope Used When Using The Search Box in Finder').with({
        :key    => 'FXDefaultSearchScope',
        :domain => 'com.apple.finder',
        :value  => 'SCcf',
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end

end
