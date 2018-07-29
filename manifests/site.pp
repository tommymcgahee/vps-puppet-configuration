node default {
  class { '::chrony':
    servers => lookup('chrony::servers', {merge => unique})
  }

  class { 'apache':
    default_vhost => true
  }

  $myApacheVhosts = lookup('apache::vhosts', {})
  create_resources('apache::vhost', $myApacheVhosts)

  file { '/var/log/httpd':
    ensure  => 'directory',
    owner   => 'apache',
    group   => 'apache',
    recurse => true,
    mode    => '0755'
  }

  file { '/var/www':
    ensure  => 'directory',
    owner   => 'apache',
    group   => 'apache',
    recurse => true,
    mode    => '0755'
  }

}
