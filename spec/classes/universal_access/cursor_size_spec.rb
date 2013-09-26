require 'spec_helper'

describe 'osx::universal_access::cursor_size' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'default' do
    it 'should default to 1.5' do
      should contain_boxen__osx_defaults('cursor size').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.universalaccess',
        :key    => 'mouseDriverCursorSize',
        :value  => 1.5,
      })
    end
  end

  describe 'with param' do
    let(:params) { {:zoom => 2} }
    it 'should set value to 2' do
      should contain_boxen__osx_defaults('cursor size').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.universalaccess',
        :key    => 'mouseDriverCursorSize',
        :value  => params[:zoom],
      })
    end
  end
end
