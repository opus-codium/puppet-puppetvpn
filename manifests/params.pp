class puppetvpn::params {
  include openvpn

  case $::osfamily {
    'Debian': {
      $etcdir = '/etc/openvpn'
      $ssldir = '/var/lib/puppet/ssl'
      $admin_user = 'root'
      $admin_group = 'root'
    }
    'FreeBSD': {
      $etcdir = '/usr/local/etc/openvpn'
      $ssldir = '/var/puppet/ssl'
      $admin_user = 'root'
      $admin_group = 'wheel'
    }
    default: {
      fail "Unsupported operating system ${::osfamily}"
    }
  }

  $config_name = 'puppetvpn'

  $puppet_cert = "${ssldir}/certs/${clientcert}.pem"
  $puppet_key  = "${ssldir}/private_keys/${clientcert}.pem"
  $puppet_ca   = "${ssldir}/certs/ca.pem"
  $puppet_crl  = "${ssldir}/crl.pem"

  $dh_size = 2048
}
