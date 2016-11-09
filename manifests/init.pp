class puppetvpn (
  $ta,
  $admin_group = $puppetvpn::params::admin_group,
  $admin_user = $puppetvpn::params::admin_user,
  $config_name = $puppetvpn::params::config_name,
  $etcdir = $puppetvpn::params::etcdir,
) inherits puppetvpn::params {

  $puppetvpn_ta = "${etcdir}/${config_name}-ta.key"

  file { $puppetvpn_ta:
    ensure  => file,
    owner   => $admin_user,
    group   => $admin_group,
    mode    => '0600',
    content => $ta,
  }
}
