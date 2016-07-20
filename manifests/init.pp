class puppetvpn (
  $ta,
) inherits puppetvpn::params {
  file { $puppetvpn_ta:
    ensure  => file,
    owner   => 'root',
    group   => $admin_group,
    mode    => '0600',
    content => $ta,
  }
}
