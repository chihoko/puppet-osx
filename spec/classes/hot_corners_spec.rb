require 'spec_helper'

describe 'osx::hot_corners' do
  let(:facts) { {:boxen_user => 'ilikebees'} }
  describe 'bottom left desktop' do
    let(:params) { {
      :corner => 'bottom left',
      :action => 'desktop',
    } }
    it 'should be tested'
  end

end
