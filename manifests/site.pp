node default {
  class { '::chrony':
    servers => lookup('chrony::servers', {merge => unique})
  }

  class { 'apache':
    default_vhost => false
  }

  $myApacheVhosts = lookup('apache::vhosts', {})
  create_resources('apache::vhost', $myApacheVhosts)
}
