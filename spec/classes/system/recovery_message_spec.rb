require 'spec_helper'

describe 'osx::system::recovery_message' do
  let(:title) { 'If this Mac is found, please call me' }
  describe 'defaults' do
    it { should contain_property_list_key('Set OS X Recovery Message').with(
      :ensure => 'present',
      :path   => '/Library/Preferences/com.apple.loginwindow.plist',
      :key    => 'LoginwindowText',
      :value  => 'osx::system::recovery_message'
    )}
  end

  describe 'given a name' do
    let(:params) { {:value => 'foo'} }

    it { should contain_property_list_key('Set OS X Recovery Message').with({
      :ensure => 'present',
      :path   => '/Library/Preferences/com.apple.loginwindow.plist',
      :key    => 'LoginwindowText',
      :value  => params[:value],
    })
    }
  end

  describe 'with ensure => absent' do
    let(:params) { {:ensure => 'absent'} }

    it do
      should contain_property_list_key('Remove OS X Recovery Message').with({
        :ensure => 'absent',
        :path   => '/Library/Preferences/com.apple.loginwindow.plist',
        :key    => 'LoginwindowText',
      })
    end
  end

end
