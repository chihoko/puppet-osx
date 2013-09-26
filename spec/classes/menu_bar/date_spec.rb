require 'spec_helper'

describe 'osx::menu_bar::date' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe 'format to "E MMM d  h:mm a"' do
    let(:params) { {:format => 'E MMM d  h:mm a'} }
    it 'should set the value to "E MMM d  h:mm a"' do
      should contain_boxen__osx_defaults('Sets the Format of the Date in the Menu Bar').with({
        :user   => facts[:boxen_user],
        :key    => 'DateFormat',
        :domain => 'com.apple.menuextra.clock',
        :value  => params[:format],
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

  describe 'analog' do
    let(:params) { {:is_analog => true} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Sets the Time to be an Analog Clock').with({
        :user   => facts[:boxen_user],
        :key    => 'IsAnalog',
        :domain => 'com.apple.menuextra.clock',
        :value  => params[:is_analog],
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

end
