require 'spec_helper'

describe 'osx::security::system_preference_lock' do
  let(:params) { {:enabled => true} }
  it 'set value to true' do
    should contain_exec("/usr/libexec/plistbuddy -c 'Set :rights:system.preferences:shared true' /etc/authorization").with({
      :command => "/usr/libexec/plistbuddy -c 'Set :rights:system.preferences:shared true' /etc/authorization",
      :unless => "/usr/libexec/plistbuddy -c 'Print :rights:system.preferences:shared' /etc/authorization | grep true",
      :user => 'root',
    })
  end

end
