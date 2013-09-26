require 'spec_helper'

describe 'osx::launchpad::reset' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it 'should reset launchpad' do
    should contain_exec('Reset LaunchPad').with({
      :command => "find /Users/ilikebees/Library/Application Support/Dock -name '*.db' -maxdepth 1 -delete",
      :onlyif  => "find /Users/ilikebees/Library/Application Support/Dock -name '*.db' -maxdepth 1 | grep '.db'",
    })
  end

end
