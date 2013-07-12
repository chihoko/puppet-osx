require 'spec_helper'

describe 'osx::appearance::font_rendering_mode' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'with $mode param' do
    let(:params) { {:mode => 1} }
    it 'should set value to 1' do
      should contain_boxen__osx_defaults('Change the Rendering Mode Used to Display Text').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'AppleFontSmoothing',
        :type   => 'int',
        :value  => 1,
      })
    end
  end
end
