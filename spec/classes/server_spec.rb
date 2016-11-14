require 'spec_helper'

describe 'puppetvpn::server' do
  let(:params) do
    {
      server_network: '10.0.0.0',
      server_netmask: '255.255.0.0',
    }
  end
  let(:facts) do
    {
      osfamily: 'Debian',
    }
  end
  let(:node) { 'example.com' }

  it do
    is_expected.to contain_openvpn__server('puppetvpn').with(
      server_network: '10.0.0.0',
      server_netmask: '255.255.0.0',
      ca: '/var/lib/puppet/ssl/certs/ca.pem',
      cert: '/var/lib/puppet/ssl/certs/example.com.pem',
      key: '/var/lib/puppet/ssl/private_keys/example.com.pem',
      crl_verify_file: '/var/lib/puppet/ssl/crl.pem',
    )
  end
end
