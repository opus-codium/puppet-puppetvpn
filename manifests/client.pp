class puppetvpn::client (
  $dev = 'tun',
) inherits puppetvpn::params {
  include ::puppetvpn

  ::openvpn::client { $puppetvpn::config_name:
    remote_host      => $servername,
    cert             => $puppetvpn::params::puppet_cert,
    key              => $puppetvpn::params::puppet_key,
    ca               => $puppetvpn::params::puppet_ca,
    tls_auth_enabled => $puppetvpn::tls_auth_enabled,
    tls_auth_content => $puppetvpn::tls_auth_content,
    dev              => $dev,
  }
}
