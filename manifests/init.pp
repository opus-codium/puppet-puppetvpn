# Common settings for configuring PuppetVPN
#
# @param tls_auth_enabled
# @param tls_auth_content
# @param admin_group
# @param admin_user
# @param config_name
# @param etcdir
class puppetvpn (
  Boolean              $tls_auth_enabled = false,
  Optional[String[1]]  $tls_auth_content = undef,
  String[1]            $admin_group = $puppetvpn::params::admin_group,
  String[1]            $admin_user = $puppetvpn::params::admin_user,
  String[1]            $config_name = $puppetvpn::params::config_name,
  Stdlib::Absolutepath $etcdir = $puppetvpn::params::etcdir,
) inherits puppetvpn::params {
}
