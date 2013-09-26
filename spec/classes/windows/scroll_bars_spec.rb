require 'spec_helper'

describe 'osx::windows::scroll_bars' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'default' do
    it 'should set value to "Automatic"' do
      should contain_boxen__osx_defaults('Sets the Scrollbar Mode').with({
        :user   => facts[:boxen_user],
        :key    => 'AppleShowScrollBars',
        :domain => 'NSGlobalDomain',
        :value  => 'Automatic',
      })
    end
  end

  describe 'with param "Manual"' do
    let(:params) { {:style => 'Manual'} }
    it 'should set value to "Manual"' do
      should contain_boxen__osx_defaults('Sets the Scrollbar Mode').with({
        :user   => facts[:boxen_user],
        :key    => 'AppleShowScrollBars',
        :domain => 'NSGlobalDomain',
        :value  => params[:style],
      })
    end
  end

end
