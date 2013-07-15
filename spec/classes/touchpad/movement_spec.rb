require 'spec_helper'

describe 'osx::touchpad::movement' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('scaling') do
    let(:params) { {:scaling => 5} }
    it 'should set the value to 5' do
      should contain_boxen__osx_defaults('Sets the Speed With Which Trackpad Movement Moves the Cursor').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.trackpad.scaling',
        :type   => 'float',
        :value  => params[:scaling],
      })
    end
  end

  describe('scrolling speed') do
    let(:params) { {:scrolling_speed => 10} }
    it 'should set the value to 10' do
      should contain_boxen__osx_defaults('Sets the Speed With Which the Trackpad Scrolls Content').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.trackpad.scrolling',
        :type   => 'float',
        :value  => params[:scrolling_speed],
      })
    end
  end

end
