# VPS Puppet Configuration
[![Build Status](https://travis-ci.org/tommymcgahee/vps-puppet-configuration.svg?branch=production)](https://travis-ci.org/tommymcgahee/vps-puppet-configuration)

This is the Puppet configuration / control repository behind my personal development VPS.

Authenticated pushes to the repository trigger the following:

* Travis CI clones the repo and builds an image that includes the docker service
* Travis decrypts a GitHub deploy key that is passed to docker during `docker build` to allow r10k-git interaction with this repo
* A test container is built using centos 7 + [Dockerfile.centos-7](docker/Dockerfile.centos-7)) and installs [Puppet 5.x](https://github.com/puppetlabs/puppet) and the [r10k gem](https://github.com/puppetlabs/r10k)
* Travis begins `docker run` and begins [scripts/entrypoint.sh](entrypoint.sh)
  * r10k pulls this control repo and creates [dynamic environments](https://github.com/puppetlabs/r10k/blob/master/doc/dynamic-environments.mkd)
  * Puppet runs a module dependency check
  * `Puppet apply` compiles and applies the catalog(s), configuring the container
* On success - Travis notifies the development VPS via a webhook which a Sinatra app listens for on the VPS
* Development VPS clones the control repo and reruns r10k / Puppet apply locally
