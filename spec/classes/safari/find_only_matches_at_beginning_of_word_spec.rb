require 'spec_helper'

describe 'osx::safari::find_only_matches_at_beginning_of_word' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Whether "Find On Page" Matches Only the Beginning of Words').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.Safari',
        :key    => 'FindOnPageMatchesWordStartsOnly',
        :value  => params[:enabled],
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Whether "Find On Page" Matches Only the Beginning of Words').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.Safari',
        :key    => 'FindOnPageMatchesWordStartsOnly',
        :value  => params[:enabled],
      })
    end
  end

end
