require 'spec_helper'

describe 'osx::login::retries_before_hint' do
  describe '5 attempts' do
    let(:params) { {:attempts => 5} }
    it 'should set the value to 5' do
      should contain_boxen__osx_defaults('Number of Attempts Before Password Hint is Shown').with({
        :user   => 'root',
        :key    => 'RetriesUntilHint',
        :domain => '/Library/Preferences/com.apple.loginwindow',
        :value  => params[:attempts],
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

end
