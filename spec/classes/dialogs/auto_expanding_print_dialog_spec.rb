require 'spec_helper'

describe 'osx::dialogs::auto_expanding_print_dialog' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set value to "true"' do
      should contain_boxen__osx_defaults('Expand print panel by default - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'PMPrintingExpandedStateForPrint',
        :value  => true,
      })
      should contain_boxen__osx_defaults('Expand print panel by default - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'PMPrintingExpandedStateForPrint2',
        :value  => true,
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set value to "false"' do
      should contain_boxen__osx_defaults('Expand print panel by default - Part 1').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'PMPrintingExpandedStateForPrint',
        :value  => false,
      })
      should contain_boxen__osx_defaults('Expand print panel by default - Part 2').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'PMPrintingExpandedStateForPrint2',
        :value  => false,
      })
    end
  end

end
