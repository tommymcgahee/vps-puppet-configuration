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
    ensure => 'directory',
    owner  => 'apache',
    group  => 'apache'
  }

  file { '/var/log/httpd/access_log':
    ensure => 'file',
    owner  => 'apache',
    group  => 'apache'
  }

  file { '/var/log/httpd/default_error.log':
    ensure => 'file',
    owner  => 'apache',
    group  => 'apache'
  }

  file { '/var/log/httpd/error_log.log':
    ensure => 'file',
    owner  => 'apache',
    group  => 'apache'
  }
}
