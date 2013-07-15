require 'spec_helper'

describe 'osx::windows::animations' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set value to true' do
      should contain_boxen__osx_defaults('Toggle Open/Close Window Animations').with({
        :user   => facts[:boxen_user],
        :key    => 'NSAutomaticWindowAnimationsEnabled',
        :domain => 'NSGlobalDomain',
        :value  => params[:enabled],
      })
    end
  end

  describe 'with resize_duration param set' do
    let(:params) { {:resize_duration => true} }
    it 'should set value to 3' do
      should contain_boxen__osx_defaults('Sets the Length of Time in Seconds When a Window is Resized').with({
        :user   => facts[:boxen_user],
        :key    => 'NSWindowResizeTime',
        :domain => 'NSGlobalDomain',
        :type   => 'float',
        :value  => params[:resize_duration],
      })
    end
  end

end
