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

  exec { "/usr/bin/openssl dhparam -out ${puppetvpn::puppetvpn_dh} 2048":
    creates => $puppetvpn::puppetvpn_dh,
  }
}
