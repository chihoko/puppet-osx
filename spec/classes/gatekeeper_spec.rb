require 'spec_helper'

describe 'osx::gatekeeper' do
  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set value to on' do
      should contain_exec('Toggles Whether to Restart Automatically if System Hangs').with({
        :command => "spctl --master-enable",
        :user    => 'root',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set value to on' do
      should contain_exec('Toggles Whether to Restart Automatically if System Hangs').with({
        :command => "spctl --master-disable",
        :user    => 'root',
      })
    end
  end

end
