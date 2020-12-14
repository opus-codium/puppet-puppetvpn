require 'spec_helper'

describe 'puppetvpn::client' do
  let(:facts) do
    {
      os: {
        family: 'Debian',
      },
      osfamily: 'Debian',
      puppet_server: 'puppet.example.com',
    }
  end
  let(:node) { 'example.com' }

  it do
    is_expected.to contain_openvpn__client('puppetvpn').with(
      remote_host: 'puppet.example.com',
      ca: '/var/lib/puppet/ssl/certs/ca.pem',
      cert: '/var/lib/puppet/ssl/certs/example.com.pem',
      key: '/var/lib/puppet/ssl/private_keys/example.com.pem',
    )
  end
end
