require 'spec_helper'

describe 'osx::network::guest' do
  describe 'enabled' do
    let(:params) { {:enabled => true} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggles Whether to Allow Guest Access to Shared Folders - Part 1').with({
        :user   => 'root',
        :key    => 'guestAccess',
        :domain => '/Library/Preferences/com.apple.AppleFileServer',
        :value  => params[:enabled],
      })

      should contain_boxen__osx_defaults('Toggles Whether to Allow Guest Access to Shared Folders - Part 2').with({
        :user   => 'root',
        :key    => 'AllowGuestAccess',
        :domain => '/Library/Preferences/com.apple.smb.server',
        :value  => params[:enabled],
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:enabled => false} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggles Whether to Allow Guest Access to Shared Folders - Part 1').with({
        :user   => 'root',
        :key    => 'guestAccess',
        :domain => '/Library/Preferences/com.apple.AppleFileServer',
        :value  => params[:enabled],
      })

      should contain_boxen__osx_defaults('Toggles Whether to Allow Guest Access to Shared Folders - Part 2').with({
        :user   => 'root',
        :key    => 'AllowGuestAccess',
        :domain => '/Library/Preferences/com.apple.smb.server',
        :value  => params[:enabled],
      })
    end
  end

end
