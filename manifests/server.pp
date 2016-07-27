class puppetvpn::server (
  $server,
  $netmask,
) inherits puppetvpn::params {
  include ::puppetvpn

  ::openvpn::server { 'puppetvpn':
    server  => $server,
    netmask => $netmask,
    ca      => $puppet_ca,
    cert    => $puppet_cert,
    key     => $puppet_key,
    crl     => $puppet_crl,
    ta      => $puppetvpn::puppetvpn_ta,
    dh      => $puppetvpn::puppetvpn_dh,
  }

  exec { "/usr/bin/openssl dhparam -out ${puppetvpn_dh} ${dh_size}":
    creates => $puppetvpn::puppetvpn_dh,
  }

  file { $puppetvpn::puppetvpn_dh:
    ensure => file,
    owner  => 'root',
    group  => $admin_group,
    mode   => '0644',
  }

  Exec["/usr/bin/openssl dhparam -out ${puppetvpn_dh} ${dh_size}"] ->
  File[$puppetvpn::puppetvpn_dh]
}
