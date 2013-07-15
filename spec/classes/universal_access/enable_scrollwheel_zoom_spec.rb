require 'spec_helper'

describe 'osx::universal_access::scrollwheel_zoom' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  let(:params) { {:enabled => true} }

  it do
    should contain_boxen__osx_defaults('Use mouse wheel (scroll gesture) to zoom').with({
      :key    => 'closeViewScrollWheelToggle',
      :domain => 'com.apple.universalaccess',
      :value  => params[:enabled],
      :user   => facts[:boxen_user]
    })
  end
end
