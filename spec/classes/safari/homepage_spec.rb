require 'spec_helper'

describe 'osx::safari::homepage' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'github.com' do
    let(:params) { {:page => 'github.com'} }
    it 'should set the value to "github.com"' do
      should contain_boxen__osx_defaults('Set the Default Safari Homepage').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.Safari',
        :key    => 'HomePage',
        :value  => params[:page],
      })
    end
  end

end
