class puppetvpn::client (
  $dev = 'tun',
) inherits puppetvpn::params {
  include ::puppetvpn

  ::openvpn::client { $puppetvpn::config_name:
    remote     => $servername,
    cert       => $puppetvpn::params::puppet_cert,
    key        => $puppetvpn::params::puppet_key,
    ca         => $puppetvpn::params::puppet_ca,
    ta         => $puppetvpn::ta,
    ta_content => $puppetvpn::ta_content,
    dev        => $dev,
  }
}
