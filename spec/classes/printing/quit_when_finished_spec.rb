require 'spec_helper'

describe 'osx::printing::quit_when_finished' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Whether the Print Dialog Should Disappear When All Jobs Are Complete').with({
        :user   => facts[:boxen_user],
        :key    => '"Quit When Finished"',
        :domain => 'com.apple.print.PrintingPrefs',
        :value  => true,
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Whether the Print Dialog Should Disappear When All Jobs Are Complete').with({
        :user   => facts[:boxen_user],
        :key    => '"Quit When Finished"',
        :domain => 'com.apple.print.PrintingPrefs',
        :value  => false,
      })
    end
  end

end
