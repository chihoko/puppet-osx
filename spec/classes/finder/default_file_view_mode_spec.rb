require 'spec_helper'

describe 'osx::finder::default_file_view_mode' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'list' do
    let(:params) { {:mode => 'list'} }
    it 'should set the value to "Nlsv"' do
      should include_class('osx::finder')
      should contain_boxen__osx_defaults('Set the File View Mode Used By Default When Opening New Finder Windows').with({
        :key    => 'FXPreferredViewStyle',
        :domain => 'com.apple.finder',
        :value  => 'Nlsv',
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove All .DS_Store Files]'
          ],
        :user   => facts[:boxen_user],
      })
    end
  end

end
