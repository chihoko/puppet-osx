require 'spec_helper'

describe 'osx::system::update::schedule' do
  describe('daily') do
    let(:params) { {:frequency => 'daily'} }
    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Sets the Interval Between Software Update Checks').with({
        :user   => 'root',
        :domain => '/Library/Preferences/com.apple.SoftwareUpdate',
        :key    => 'ScheduleFrequency',
        :type   => 'int',
        :value  => 1,
      })
    end
  end

end
