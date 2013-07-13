require 'spec_helper'

describe 'osx::energy::sleep' do

  describe 'with $on_battery param set to 100' do
    let(:params) { {:on_battery => 100} }
    it 'should set the value to 100' do
      should contain_exec('Set Time Until System Sleeps When on Battery Power').with({
        :command => "pmset -b sleep 100",
        :user    => 'root',
        :unless  => "pmset -g custom | grep 'Battery Power' -A 16 | grep -E '^\ssleep\s+100'",
      })
    end
  end

  describe 'with $when_plugged_in param set to 100' do
    let(:params) { {:when_plugged_in => 100} }
    it 'should set the value to 100' do
      should contain_exec('Set Time Until System Sleeps When Plugged In').with({
        :command => "pmset -c sleep 100",
        :user    => 'root',
        :unless  => "pmset -g custom | grep 'AC Power' -A 17 | grep -E '^\ssleep\s+100'",
      })
    end
  end

end
