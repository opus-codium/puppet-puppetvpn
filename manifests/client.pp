class puppetvpn::client inherits puppetvpn::params {
  include ::puppetvpn

  ::openvpn::client { $puppetvpn::config_name:
    remote => $servername,
    cert   => $puppetvpn::params::puppet_cert,
    key    => $puppetvpn::params::puppet_key,
    ca     => $puppetvpn::params::puppet_ca,
    ta     => $puppetvpn::params::puppetvpn_ta,
  }
}
