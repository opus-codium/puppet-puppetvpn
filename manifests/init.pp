class puppetvpn (
  $ta,
) inherits puppetvpn::params {
  file { $puppetvpn::params::puppetvpn_ta:
    ensure  => file,
    owner   => 'root',
    group   => $puppetvpn::params::admin_group,
    mode    => '0600',
    content => $ta,
  }
}
