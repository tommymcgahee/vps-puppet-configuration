node default {
  class { '::chrony':
    servers => lookup('chrony::servers', {merge => unique})
  }

  class { 'apache':
    default_vhost => false
  }

  $myApacheVhosts = lookup('apache::vhosts', {})
  create_resources('apache::vhost', $myApacheVhosts)

  file { '/var/log/httpd':
    ensure  => 'directory',
    recurse => remote,
    mode    => '0644',
    owner   => 'apache',
    group   => 'apache'
  }

  file { '/var/www':
    ensure  => 'directory',
    recurse => remote,
    mode    => '0644',
    owner   => 'apache',
    group   => 'apache',
  }
}
