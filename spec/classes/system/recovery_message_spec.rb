require 'spec_helper'

describe 'osx::system::recovery_message' do
  describe 'defaults' do
    let(:title) { 'If this Mac is found, please call me' }

    it { should contain_property_list_key('Set OS X Recovery Message').with(
      :ensure => 'present',
      :path   => '/Library/Preferences/com.apple.loginwindow.plist',
      :key    => 'LoginwindowText',
      :value  => title
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
