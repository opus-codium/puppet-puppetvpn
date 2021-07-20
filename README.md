# puppetvpn

<!-- header GFM -->
[![Build Status](https://img.shields.io/github/workflow/status/opus-codium/puppet-puppetvpn/Release)](https://github.com/opus-codium/puppet-puppetvpn/releases)
[![Puppet Forge](https://img.shields.io/puppetforge/v/opuscodium/puppetvpn.svg)](https://forge.puppetlabs.com/opuscodium/puppetvpn)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/opuscodium/puppetvpn.svg)](https://forge.puppetlabs.com/opuscodium/puppetvpn)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/opuscodium/puppetvpn.svg)](https://forge.puppetlabs.com/opuscodium/puppetvpn)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/opuscodium/puppetvpn.svg)](https://forge.puppetlabs.com/opuscodium/puppetvpn)
[![License](https://img.shields.io/github/license/opus-codium/puppet-puppetvpn.svg)](https://github.com/voxpupuli/opuscodium-puppetvpn/blob/master/LICENSE.md)
<!-- header -->

#### Table of Contents

<!-- vim-markdown-toc GFM -->

* [Overview](#overview)
* [Module Description](#module-description)
* [Setup](#setup)
* [Usage](#usage)
* [Limitations](#limitations)
* [Contributing](#contributing)

<!-- vim-markdown-toc -->

## Overview

Setup OpenVPN using Puppet PKI.

## Module Description

Make Puppet managed hosts reachable through a VPN using Puppet's Public Key
Infrastructure.

## Setup

On the Puppet master:

~~~puppet
class { 'puppetvpn::server':
  server_network => '10.0.0.0',
  server_netmask => '255.255.0.0',
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

