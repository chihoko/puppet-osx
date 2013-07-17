require 'spec_helper'

describe 'osx::screen_capture' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'format' do
    let(:params) { {:format => 'jpg'} }
    it 'should set value to "jpg"' do
      should contain_boxen__osx_defaults('Sets the Format of Images Taken With Screen Capture').with({
        :user   => facts[:boxen_user],
        :key    => 'type',
        :domain => 'com.apple.screencapture',
        :value  => params[:format],
      })
    end
  end

  describe 'location' do
    let(:params) { {:location => 'path'} }
    it 'should set value to "path"' do
      should contain_boxen__osx_defaults('Sets the Location of Images Taken With Screen Capture').with({
        :user   => facts[:boxen_user],
        :key    => 'location',
        :domain => 'com.apple.screencapture',
        :value  => params[:location],
      })
    end
  end

  describe 'add shadow' do
    let(:params) { {:add_shadow => false} }
    it 'should set value to true' do
      should contain_boxen__osx_defaults('Toggles Whether Images Taken With Screen Capture Include Drop Shadows').with({
        :user   => facts[:boxen_user],
        :key    => 'disable-shadow',
        :domain => 'com.apple.screencapture',
        :value  => !params[:add_shadow],
      })
    end
  end

  describe 'base name' do
    let(:params) { {:base_name => 'base'} }
    it 'should set value to "base"' do
      should contain_boxen__osx_defaults('Sets the Base Filename Used for Screenshots').with({
        :user   => facts[:boxen_user],
        :key    => 'name',
        :domain => 'com.apple.screencapture',
        :value  => params[:base_name],
      })
    end
  end

end
