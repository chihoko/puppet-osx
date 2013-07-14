require 'spec_helper'

describe 'osx::system::host_name' do
  let(:params) { {:name => 'localHost'} }
  it 'set the hostname' do
    should contain_exec('hostname localHost').with({
      :command => "hostname localHost",
      :unless  => "hostname | grep localHost",
      :user    => 'root',
    })

    should contain_exec('scutil --set ComputerName localHost').with({
      :command => "scutil --set ComputerName localHost",
      :unless  => "scutil --get ComputerName | grep localHost",
      :user    => 'root',
    })

    should contain_exec('scutil --set HostName localHost').with({
      :command => "scutil --set HostName localHost",
      :unless  => "scutil --get HostName | grep localHost",
      :user    => 'root',
    })

    should contain_exec('scutil --set LocalHostName localHost').with({
      :command => "scutil --set LocalHostName localHost",
      :unless  => "scutil --get LocalHostName | grep localHost",
      :user    => 'root',
    })

    should contain_boxen__osx_defaults('Update Computer NetBIOS Host Name - Part 1').with({
      :user   => 'root',
      :domain => '/Library/Preferences/SystemConfiguration/com.apple.smb.server',
      :key    => 'NetBIOSName',
      :value  => params[:name],
    })

    should contain_boxen__osx_defaults('Update Computer NetBIOS Host Name - Part 2').with({
      :user   => 'root',
      :domain => '/Library/Preferences/SystemConfiguration/com.apple.smb.server',
      :key    => 'ServerDecription',
      :value  => params[:name],
    })
  end

end
