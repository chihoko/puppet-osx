require 'spec_helper'

describe 'osx::dock::indicator_lights' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to "true"' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Toggle Indicator Lights Under Running Applications').with({
        :key    => 'show-process-indicators',
        :domain => 'com.apple.dock',
        :value  => true,
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user]
      })
    end
  end

end
