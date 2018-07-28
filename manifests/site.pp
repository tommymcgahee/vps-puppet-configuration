node default {
  class { '::chrony':
    servers => lookup('chrony::servers', {merge => unique})
  }

  class { 'apache':
    default_vhost => false
  }

  file {'/etc/httpd/conf/mime.types':
    ensure => link,
    target => '/etc/mime.types',
  }

  $myApacheVhosts = lookup('apache::vhosts', {})
  create_resources('apache::vhost', $myApacheVhosts)
}
