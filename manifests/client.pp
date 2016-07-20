class puppetvpn::client inherits puppetvpn::params {
  include ::puppetvpn

  ::openvpn::client { 'puppetvpn':
    remote => $servername,
    cert   => $puppet_cert,
    key    => $puppet_key,
    ca     => $puppet_ca,
    ta     => $puppetvpn::puppetvpn_ta,
  }
}
