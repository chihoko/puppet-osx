require 'spec_helper'

describe 'osx::keyboard::key_repeat_delay' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'with parameters' do
    let(:params) { {:delay => 10} }

    it 'allows you to pass a delay value' do
      should contain_boxen__osx_defaults('key repeat delay').with({
        :domain => 'NSGlobalDomain',
        :key    => 'InitialKeyRepeat',
        :value  => params[:delay],
        :user   => facts[:boxen_user]
      })
    end
  end
end
