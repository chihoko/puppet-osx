require 'spec_helper'

describe 'osx::safari::thumbnail_cache' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to 2' do
      should contain_boxen__osx_defaults('Toggle Whether the Cache for "Top Sites" and "History" is Enabled').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.Safari',
        :key    => 'DebugSnapshotsUpdatePolicy',
        :type   => 'int',
        :value  => 2,
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set the value to 0' do
      should contain_boxen__osx_defaults('Toggle Whether the Cache for "Top Sites" and "History" is Enabled').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.Safari',
        :key    => 'DebugSnapshotsUpdatePolicy',
        :type   => 'int',
        :value  => 0,
      })
    end
  end

end
