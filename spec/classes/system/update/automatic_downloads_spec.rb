require 'spec_helper'

describe 'osx::system::update::automatic_downloads' do
  describe('enabled') do
    let(:params) { {:enabled => true} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Whether Software Updates are Downloaded in the Background when Available').with({
        :user   => 'root',
        :domain => 'AutomaticDownload',
        :key    => '/Library/Preferences/com.apple.SoftwareUpdate',
        :value  => params[:enabled],
      })
    end
  end

  describe('disabled') do
    let(:params) { {:enabled => false} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Whether Software Updates are Downloaded in the Background when Available').with({
        :user   => 'root',
        :domain => 'AutomaticDownload',
        :key    => '/Library/Preferences/com.apple.SoftwareUpdate',
        :value  => params[:enabled],
      })
    end
  end

end
