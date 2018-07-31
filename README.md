# VPS Puppet Configuration
[![Build Status](https://travis-ci.org/tommymcgahee/vps-puppet-configuration.svg?branch=production)](https://travis-ci.org/tommymcgahee/vps-puppet-configuration)

This is the Puppet configuration / control repository behind my personal development VPS.

Authenticated pushes to the repository trigger the following:

1. Travis CI clones the repo and builds an image that includes the docker service
2. Travis decrypts a GitHub deploy key that is passed to docker during `docker build` to allow r10k-git interaction with this repo
3. A test container is built using centos 7 + [Dockerfile.centos-7](docker/Dockerfile.centos-7) and installs [Puppet 5.x](https://github.com/puppetlabs/puppet) and the [r10k gem](https://github.com/puppetlabs/r10k)
4. Travis begins `docker run` and starts [entrypoint.sh](scripts/entrypoint.sh)
    1. r10k pulls this control repo and creates [dynamic environments](https://github.com/puppetlabs/r10k/blob/master/doc/dynamic-environments.mkd)
    2. Puppet runs a module dependency check
    3. `Puppet apply` compiles and applies the catalog(s), configuring the container
5. On success - Travis notifies the development VPS via a webhook which a Sinatra app listens for on the VPS
6. Development VPS clones the control repo and reruns r10k / Puppet apply locally
