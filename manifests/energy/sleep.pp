class osx::energy::sleep(
  $on_battery      = undef,
  $when_plugged_in = undef ) {

  if is_integer($on_battery) {
    exec { 'Set Time Until System Sleeps When on Battery Power':
      command => "pmset -b sleep ${on_battery}",
      user    => root,
      unless  => "pmset -g custom | grep 'Battery Power' -A 16 | grep -E '^\ssleep\s+${on_battery}'",
    }
  }

  if is_integer($when_plugged_in) {
    exec { 'Set Time Until System Sleeps When Plugged In':
      command => "pmset -c sleep ${when_plugged_in}",
      user    => root,
      unless  => "pmset -g custom | grep 'AC Power' -A 17 | grep -E '^\ssleep\s+${when_plugged_in}'",
    }
  }
}
