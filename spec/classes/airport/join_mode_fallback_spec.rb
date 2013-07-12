require 'spec_helper'

describe 'osx::airport::join_mode_fallback' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'Prompt' do
    let(:params) { {:mode => 'Prompt'} }

    it 'should set Join Mode Fallback to "Prompt"' do
      should include_class('osx::airport')
      should contain_exec('Set What to Do When None of the Preferred Networks Are Available').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinModeFallback=Prompt",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinModeFallback | grep Prompt",
        :user    => 'root',
      })
    end
  end

  describe 'JoinOpen' do
    let(:params) { {:mode => 'JoinOpen'} }

    it 'should set Join Mode Fallback to "JoinOpen"' do
      should include_class('osx::airport')
      should contain_exec('Set What to Do When None of the Preferred Networks Are Available').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinModeFallback=JoinOpen",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinModeFallback | grep JoinOpen",
        :user    => 'root',
      })
    end
  end

  describe 'KeepLooking' do
    let(:params) { {:mode => 'KeepLooking'} }

    it 'should set Join Mode Fallback to "KeepLooking"' do
      should include_class('osx::airport')
      should contain_exec('Set What to Do When None of the Preferred Networks Are Available').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinModeFallback=KeepLooking",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinModeFallback | grep KeepLooking",
        :user    => 'root',
      })
    end
  end

  describe 'DoNothing' do
    let(:params) { {:mode => 'DoNothing'} }

    it 'should set Join Mode Fallback to "DoNothing"' do
      should include_class('osx::airport')
      should contain_exec('Set What to Do When None of the Preferred Networks Are Available').with({
        :command => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinModeFallback=DoNothing",
        :unless  => "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinModeFallback | grep DoNothing",
        :user    => 'root',
      })
    end
  end

end
