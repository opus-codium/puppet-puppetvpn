class puppetvpn::server (
  $server,
  $netmask,
) inherits puppetvpn::params {
  include ::puppetvpn

  ::openvpn::server { 'puppetvpn':
    server  => $server,
    netmask => $netmask,
    ca      => $puppetvpn::params::puppet_ca,
    cert    => $puppetvpn::params::puppet_cert,
    key     => $puppetvpn::params::puppet_key,
    crl     => $puppetvpn::params::puppet_crl,
    ta      => $puppetvpn::params::puppetvpn_ta,
    dh      => $puppetvpn::params::puppetvpn_dh,
  }

  exec { "/usr/bin/openssl dhparam -out ${puppetvpn::params::puppetvpn_dh} ${puppetvpn::params::dh_size}":
    creates => $puppetvpn::puppetvpn_dh,
  }

  file { $puppetvpn::puppetvpn_dh:
    ensure => file,
    owner  => 'root',
    group  => $puppetvpn::params::admin_group,
    mode   => '0644',
  }

  Exec["/usr/bin/openssl dhparam -out ${puppetvpn::params::puppetvpn_dh} ${puppetvpn::params::dh_size}"] ->
  File[$puppetvpn::params::puppetvpn_dh]
}
