class puppetvpn::params {
  include openvpn

  case $facts.get('os.family') {
    'Debian': {
      $etcdir = '/etc/openvpn'
      if $facts['aio_agent_version'] {
        $ssldir = '/etc/puppetlabs/puppet/ssl'
      } else {
        $ssldir = '/var/lib/puppet/ssl'
      }
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
      fail "Unsupported operating system ${facts.get('os.family')}"
    }
  }

  $config_name = 'puppetvpn'

  $puppet_cert = "${ssldir}/certs/${clientcert}.pem"
  $puppet_key  = "${ssldir}/private_keys/${clientcert}.pem"
  $puppet_ca   = "${ssldir}/certs/ca.pem"
  $puppet_crl  = "${ssldir}/crl.pem"

  $dh_size = 2048
}
