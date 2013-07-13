require 'spec_helper'

describe 'osx::finder::quicklook_text_selection' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to "true"' do
      should contain_boxen__osx_defaults('Toggle Whether You Can Select Text in a QuickLook Window').with({
        :domain => 'com.apple.finder',
        :key    => 'QLEnableTextSelection',
        :value  => true,
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set the value to "false"' do
      should contain_boxen__osx_defaults('Toggle Whether You Can Select Text in a QuickLook Window').with({
        :domain => 'com.apple.finder',
        :key    => 'QLEnableTextSelection',
        :value  => false,
        :user   => facts[:boxen_user]
      })
    end
  end

end
