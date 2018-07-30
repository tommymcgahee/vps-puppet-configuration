class profile::sinatra {

  exec { 'yum groupinstall Development Tools':
    command => '/usr/bin/yum -y --disableexcludes=all groupinstall "Development Tools"',
    unless  => '/usr/bin/yum grouplist "Development Tools" | /bin/grep "^Installed"',
    timeout => 600 ,
    before  => Package['thin']
  }

  file { '/opt/puppetlabs/puppet/bin/gem':
    ensure => 'link',
    target => '/usr/local/bin/gem',
    before => [ Package['sinatra'], Package['thin'] ]
  }

  package { 'sinatra':
    provider => 'gem',
    alias    => 'ruby-sinatra',
    ensure   => 'installed'
  }

  package { 'thin':
    provider => 'gem',
    alias    => 'ruby-thin',
    ensure   => 'installed',
  }

}
