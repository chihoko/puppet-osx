require 'spec_helper'

describe 'osx::mouse::movement' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe 'scaling set to 10' do
    let(:params) { {:scaling => 10} }
    it 'should set the value to 10' do
      should contain_boxen__osx_defaults('Sets the Speed With Which Mouse Movement Moves the Cursor').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.mouse.scaling',
        :type   => 'float',
        :value  => params[:scaling],
      })
    end
  end

  describe 'scrolling speed set to 10' do
    let(:params) { {:scrolling_speed => 10} }
    it 'should set the value to 10' do
      should contain_boxen__osx_defaults('Sets the Speed With Which the Mouse Scrolls Content').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.mouse.scrolling',
        :type   => 'float',
        :value  => params[:scrolling_speed],
      })
    end
  end

end
