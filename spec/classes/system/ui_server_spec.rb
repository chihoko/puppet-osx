require 'spec_helper'

describe 'osx::system::ui_server' do
  it 'should set ui_server refresh to true' do
    should contain_exec('killall SystemUIServer').with({
      :refreshonly => true,
    })
  end
end
