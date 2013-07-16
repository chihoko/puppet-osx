require 'spec_helper'

describe 'osx::system::restart_on_hang' do
  describe('enabled') do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to "on"' do
      should contain_exec('Toggles Whether to Restart Automatically if System Hangs').with({
        :command => "systemsetup -setrestartfreeze on",
        :unless  => "systemsetup -getrestartfreeze On",
        :user    => 'root',
      })
    end
  end

  describe('disabled') do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to "on"' do
      should contain_exec('Toggles Whether to Restart Automatically if System Hangs').with({
        :command => "systemsetup -setrestartfreeze off",
        :unless  => "systemsetup -getrestartfreeze Off",
        :user    => 'root',
      })
    end
  end
end
