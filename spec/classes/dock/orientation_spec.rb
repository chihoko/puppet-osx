require 'spec_helper'

describe 'osx::dock::orientation' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'default' do
    it 'should set the value to "bottom"' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Set the Position of the Dock Relative to the Desktop').with({
        :key    => 'orientation',
        :domain => 'com.apple.dock',
        :value  => 'bottom',
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'orientation' do
    let(:params) { {:orientation => 'bottom'} }
    it 'should set the value to "bottom"' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Set the Position of the Dock Relative to the Desktop').with({
        :key    => 'orientation',
        :domain => 'com.apple.dock',
        :value  => 'bottom',
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user]
      })
    end
  end

end
