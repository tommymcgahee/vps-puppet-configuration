node default {
  class { '::chrony':
    servers => lookup('chrony::servers', {merge => unique})
  }

  class { 'apache':
    default_vhost => false,
    logroot_owner: apache,
    logroot_group: apache
  }

  $myApacheVhosts = lookup('apache::vhosts', {})
  create_resources('apache::vhost', $myApacheVhosts)
}
