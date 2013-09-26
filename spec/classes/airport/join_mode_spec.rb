require 'spec_helper'

describe 'osx::airport::join_mode' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'Automatic' do
    let(:params) { {:mode => 'Automatic'} }

    it 'should set Join Mode to "Automatic"' do
      should include_class('osx::airport')
      should contain_exec('Set What to Do When Preferred Networks Are Available').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinMode=Automatic",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinMode | grep Automatic",
        :user    => 'root',
      })
    end
  end

  describe 'Preferred' do
    let(:params) { {:mode => 'Preferred'} }

    it 'should set Join Mode to "Preferred"' do
      should include_class('osx::airport')
      should contain_exec('Set What to Do When Preferred Networks Are Available').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinMode=Preferred",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinMode | grep Preferred",
        :user    => 'root',
      })
    end
  end

  describe 'Ranked' do
    let(:params) { {:mode => 'Ranked'} }

    it 'should set Join Mode to "Ranked"' do
      should include_class('osx::airport')
      should contain_exec('Set What to Do When Preferred Networks Are Available').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinMode=Ranked",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinMode | grep Ranked",
        :user    => 'root',
      })
    end
  end

  describe 'Recent' do
    let(:params) { {:mode => 'Recent'} }

    it 'should set Join Mode to "Recent"' do
      should include_class('osx::airport')
      should contain_exec('Set What to Do When Preferred Networks Are Available').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinMode=Recent",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinMode | grep Recent",
        :user    => 'root',
      })
    end
  end

  describe 'Strongest' do
    let(:params) { {:mode => 'Strongest'} }

    it 'should set Join Mode to "Strongest"' do
      should include_class('osx::airport')
      should contain_exec('Set What to Do When Preferred Networks Are Available').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinMode=Strongest",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinMode | grep Strongest",
        :user    => 'root',
      })
    end
  end

end
