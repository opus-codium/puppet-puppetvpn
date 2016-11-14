class puppetvpn (
  $tls_auth_enabled = false,
  $tls_auth_content = undef,
  $admin_group = $puppetvpn::params::admin_group,
  $admin_user = $puppetvpn::params::admin_user,
  $config_name = $puppetvpn::params::config_name,
  $etcdir = $puppetvpn::params::etcdir,
) inherits puppetvpn::params {
}
