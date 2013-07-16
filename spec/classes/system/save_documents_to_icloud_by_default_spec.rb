require 'spec_helper'

describe 'osx::system::save_documents_to_icloud_by_default' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('enabled') do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Whether to Save New Documents to iCloud by Default').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'NSDocumentSaveNewDocumentsToCloud',
        :value  => true,
      })
    end
  end

  describe('disabled') do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Whether to Save New Documents to iCloud by Default').with({
        :user   => facts[:boxen_user],
        :domain => 'NSGlobalDomain',
        :key    => 'NSDocumentSaveNewDocumentsToCloud',
        :value  => false,
      })
    end
  end

end
