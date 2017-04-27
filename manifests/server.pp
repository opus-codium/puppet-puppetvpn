class puppetvpn::server (
  $server_network,
  $server_netmask,
  $dev = 'tun',
  $dh_size = $puppetvpn::params::dh_size,
) inherits puppetvpn::params {
  include ::puppetvpn

  $puppetvpn_dh = "${puppetvpn::etcdir}/${puppetvpn::config_name}-dh${dh_size}.pem"

  ::openvpn::server { $puppetvpn::config_name:
    server_network   => $server_network,
    server_netmask   => $server_netmask,
    ca               => $puppetvpn::params::puppet_ca,
    cert             => $puppetvpn::params::puppet_cert,
    key              => $puppetvpn::params::puppet_key,
    crl_verify_file  => $puppetvpn::params::puppet_crl,
    tls_auth_enabled => $puppetvpn::tls_auth_enabled,
    tls_auth_content => $puppetvpn::tls_auth_content,
    dh               => $puppetvpn_dh,
    dev              => $dev,
  }

  exec { "/usr/bin/openssl dhparam -out ${puppetvpn_dh} ${dh_size}":
    creates => $puppetvpn_dh,
  }

  file { $puppetvpn_dh:
    ensure => file,
    owner  => $puppetvpn::admin_user,
    group  => $puppetvpn::admin_group,
    mode   => '0644',
  }

  Exec["/usr/bin/openssl dhparam -out ${puppetvpn_dh} ${dh_size}"]
  -> File[$puppetvpn_dh]
}
