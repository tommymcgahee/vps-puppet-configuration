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
    recurse => true,
    mode    => '0644',
    owner   => 'apache',
    group   => 'apache'
  }

  file { '/var/log/httpd':
    ensure  => 'directory',
    mode    => '0755'
  }

  file { '/var/www':
    ensure  => 'directory',
    recurse => true,
    owner   => 'apache',
    group   => 'apache',
  }

  file { '/var/www':
    ensure  => 'directory',
    mode    => '0755'
  }

}
