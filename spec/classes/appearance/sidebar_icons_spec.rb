require 'spec_helper'

describe 'osx::appearance::sidebar_icons' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'with $size param set to "small"' do
    let(:params) { {:size => 'small'} }
    it 'should set value to 1' do
      should contain_boxen__osx_defaults('Set the Size of the Icons in the Sidebar').with({
        :user   => facts[:boxen_user],
        :key    => 'NSTableViewDefaultSizeMode',
        :domain => 'NSGlobalDomain',
        :value  => 1,
      })
    end
  end

  describe 'with $size param set to "medium"' do
    let(:params) { {:size => 'medium'} }
    it 'should set value to 2' do
      should contain_boxen__osx_defaults('Set the Size of the Icons in the Sidebar').with({
        :user   => facts[:boxen_user],
        :key    => 'NSTableViewDefaultSizeMode',
        :domain => 'NSGlobalDomain',
        :value  => 2,
      })
    end
  end

  describe 'with $size param set to "large"' do
    let(:params) { {:size => 'large'} }
    it 'should set value to 3' do
      should contain_boxen__osx_defaults('Set the Size of the Icons in the Sidebar').with({
        :user   => facts[:boxen_user],
        :key    => 'NSTableViewDefaultSizeMode',
        :domain => 'NSGlobalDomain',
        :value  => 3,
      })
    end
  end

end
