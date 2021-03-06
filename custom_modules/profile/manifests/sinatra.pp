class profile::sinatra {

  exec { 'yum groupinstall Development Tools':
    command => '/usr/bin/yum -y --disableexcludes=all groupinstall "Development Tools"',
    unless  => '/usr/bin/yum grouplist "Development Tools" | /bin/grep "^Installed"',
    timeout => 600 ,
    before  => Package['thin']
  }

  package { 'sinatra':
    provider => 'puppet_gem',
    alias    => 'ruby-sinatra',
    ensure   => 'installed'
  }

  package { 'thin':
    provider => 'puppet_gem',
    alias    => 'ruby-thin',
    ensure   => 'installed',
  }

}
