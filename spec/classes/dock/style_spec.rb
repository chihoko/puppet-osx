require 'spec_helper'

describe 'osx::dock::style' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'set to 3D' do
    let(:params) { {:style => '3D'} }
    it 'should set the value to "false"' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Set the Style of the Dock').with({
        :key    => 'no-glass',
        :domain => 'com.apple.dock',
        :value  => false,
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'set to 2D' do
    let(:params) { {:style => '2D'} }
    it 'should set the value to "true"' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Set the Style of the Dock').with({
        :key    => 'no-glass',
        :domain => 'com.apple.dock',
        :value  => true,
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user]
      })
    end
  end

end
