class puppetvpn::server (
  $server,
  $netmask,
  $dev = 'tun',
  $dh_size = $puppetvpn::params::dh_size,
) inherits puppetvpn::params {
  include ::puppetvpn

  $puppetvpn_dh = "${puppetvpn::etcdir}/${puppetvpn::config_name}-dh${dh_size}.pem"

  ::openvpn::server { $puppetvpn::config_name:
    server     => $server,
    netmask    => $netmask,
    ca         => $puppetvpn::params::puppet_ca,
    cert       => $puppetvpn::params::puppet_cert,
    key        => $puppetvpn::params::puppet_key,
    crl        => $puppetvpn::params::puppet_crl,
    ta         => $puppetvpn::ta,
    ta_content => $puppetvpn::ta_content,
    dh         => $puppetvpn_dh,
    dev        => $dev,
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

  Exec["/usr/bin/openssl dhparam -out ${puppetvpn_dh} ${dh_size}"] ->
  File[$puppetvpn_dh]
}
