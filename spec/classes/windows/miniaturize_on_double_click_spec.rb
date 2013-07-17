require 'spec_helper'

describe 'osx::windows::miniaturize_on_double_click' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set value to 1' do
      should contain_boxen__osx_defaults('Miniaturize Windows on Double-Click').with({
        :user   => facts[:boxen_user],
        :key    => 'AppleMiniaturizeOnDoubleClick',
        :domain => 'NSGlobalDomain',
        :type   => 'int',
        :value  => 1,
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set value to 0' do
      should contain_boxen__osx_defaults('Miniaturize Windows on Double-Click').with({
        :user   => facts[:boxen_user],
        :key    => 'AppleMiniaturizeOnDoubleClick',
        :domain => 'NSGlobalDomain',
        :type   => 'int',
        :value  => 0,
      })
    end
  end

end
