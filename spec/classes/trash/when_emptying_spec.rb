require 'spec_helper'

describe 'osx::trash::when_emptying' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  it do
    should include_class('osx::finder')
  end

  describe('warn') do
    let(:params) { {:warn => true} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle the Warning when Emptying the Trash').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.finder',
        :key    => 'WarnOnEmptyTrash',
        :value  => params[:warn],
        :notify => 'Exec[killall Finder]',
      })
    end
  end

  describe('secure') do
    let(:params) { {:secure => true} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Whether Emptying the Trash is Done Securely').with({
        :user   => facts[:boxen_user],
        :domain => 'com.apple.finder',
        :key    => 'EmptyTrashSecurely',
        :value  => params[:secure],
        :notify => 'Exec[killall Finder]',
      })
    end
  end

end
