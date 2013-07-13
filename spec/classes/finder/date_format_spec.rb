require 'spec_helper'

describe 'osx::finder::date_format' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'relative' do
    let(:params) { {:format => 'relative'} }
    it 'should run the command with $format_bool set to true'
  end

  describe 'absolute' do
    let(:params) { {:format => 'absolute'} }
    it 'should run the command with $format_bool set to false'
  end

end
