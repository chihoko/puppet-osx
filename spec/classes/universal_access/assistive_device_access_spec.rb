require 'spec_helper'

describe 'osx::universal_access::assistive_device_access' do
  describe('enabled') do
    let(:params) { {:enabled => true} }
    it 'should set the value to "present"' do
      should contain_file('/private/var/db/.AccessibilityAPIEnabled').with({
        :ensure  => 'present',
        :content => 'a',
        :owner   => 'root',
        :group   => 'wheel',
        :mode    => '0444',
      })
    end
  end

  describe('disabled') do
    let(:params) { {:enabled => false} }
    it 'should set the value to "absent"' do
      should contain_file('/private/var/db/.AccessibilityAPIEnabled').with({
        :ensure  => 'absent',
        :content => 'a',
        :owner   => 'root',
        :group   => 'wheel',
        :mode    => '0444',
      })
    end
  end

end
