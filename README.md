# puppetvpn

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
4. [Usage](#usage)
5. [Limitations](#limitations)
6. [Contributing](#contributing)

## Overview

Setup OpenVPN using Puppet PKI.

## Module Description

Make Puppet managed hosts reachable through a VPN using Puppet's Public Key
Infrastructure.

## Setup

On all nodes:

~~~puppet
class { 'puppetvpn':
  ta => '...' # OpenVPN static key
              #
              # Generate yours with:
              # openvpn --genkey --secret ta.key
}
~~~

On the Puppet master:

~~~puppet
class { 'puppetvpn::server':
  server  => '10.0.0.0',
  netmask => '255.255.0.0',
}
~~~

On the other nodes:

~~~puppet
include puppetvpn::client
~~~

## Usage

No further configuration is needed.

## Limitations

The current implementation supports Debian GNU/Linux and FreeBSD. Patches to
add support to more platforms are welcome.

## Contributing

1. Fork it ( https://github.com/opus-codium/puppet-puppetvpn/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

