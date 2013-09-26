require 'spec_helper'

describe 'osx::mission_control::animation' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe '10' do
    let(:params) { {:speed => 10} }
    it 'should set the value to 10' do
      should contain_boxen__osx_defaults('Set the Speed of Transitioning Into and Out of Mission Control').with({
        :user   => facts[:boxen_user],
        :key    => 'expose-animation-duration',
        :domain => 'com.apple.dock',
        :type   => 'float',
        :value  => params[:speed],
      })
    end
  end

end
