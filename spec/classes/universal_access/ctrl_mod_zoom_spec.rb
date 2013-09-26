require 'spec_helper'

describe 'osx::universal_access::ctrl_mod_zoom' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  it 'set the values' do
    should contain_boxen__osx_defaults('Use scroll gesture with the Ctrl (^) key to zoom - Part 1').with({
      :user   => facts[:boxen_user],
      :domain => 'com.apple.universalaccess',
      :key    => 'HIDScrollZoomModifierMask',
      :value  => 262144,
    })

    should contain_boxen__osx_defaults('Use scroll gesture with the Ctrl (^) key to zoom - Part 2').with({
      :user   => facts[:boxen_user],
      :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
      :key    => 'HIDScrollZoomModifierMask',
      :value  => 262144,
    })
  end
end
