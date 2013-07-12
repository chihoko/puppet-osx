require 'spec_helper'

describe 'osx::appearance::colors' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  it do
    should include_class('osx::system::ui_server')
  end

  describe 'with $main param set to "blue"' do
    let(:params) { {:main => 'blue'} }
    it 'should set value to "blue"' do
      should include_class('osx::system::ui_server')
      should contain_boxen__osx_defaults('Set the Main UI Color').with({
        :user   => facts[:boxen_user],
        :key    => 'AppleAquaColorVariant',
        :domain => 'NSGlobalDomain',
        :type   => 'int',
        :value  => 1,
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

  describe 'with $main param set to "graphite"' do
    let(:params) { {:main => 'graphite'} }
    it 'should set value to "graphite"' do
      should include_class('osx::system::ui_server')
      should contain_boxen__osx_defaults('Set the Main UI Color').with({
        :user   => facts[:boxen_user],
        :key    => 'AppleAquaColorVariant',
        :domain => 'NSGlobalDomain',
        :type   => 'int',
        :value  => 6,
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

  describe 'with $highlight param set to "graphite"' do
    let(:params) { {:highlight => 'graphite'} }
    it 'should set value to "graphite"' do
      should include_class('osx::system::ui_server')
      should contain_boxen__osx_defaults('Set the UI Highlight Color').with({
        :user   => facts[:boxen_user],
        :key    => 'AppleHighlightColor',
        :domain => 'NSGlobalDomain',
        :value  => '0.780400 0.815700 0.858800',
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

end
