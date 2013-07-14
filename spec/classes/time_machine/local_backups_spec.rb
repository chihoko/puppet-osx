require 'spec_helper'

describe 'osx::time_machine::local_backups' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('enabled') do
    let(:params) { {:enabled => true} }
    it 'should set the value to true' do
      should contain_exec('Toggle Whether Local Time Machine Backups are Enabled').with({
        :command => "tmutil enablelocal",
        :onlyif  => "hash tmutil &> /dev/null && tmutil destinationinfo | grep -E  \"Kind\\s+:\\s+Local\"",
        :user    => 'root',
      })
    end
  end

  describe('disabled') do
    let(:params) { {:enabled => false} }
    it 'should set the value to true' do
      should contain_exec('Toggle Whether Local Time Machine Backups are Enabled').with({
        :command => "tmutil disablelocal",
        :onlyif  => "hash tmutil &> /dev/null && tmutil destinationinfo | grep -LE \"Kind\\s+:\\s+Local\"",
        :user    => 'root',
      })
    end
  end

end
