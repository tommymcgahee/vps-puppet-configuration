class profile::sinatra {


  exec { 'yum groupinstall Development Tools':
    command => '/usr/bin/yum -y --disableexcludes=all groupinstall "Development Tools"',
    unless  => '/usr/bin/yum grouplist "Development Tools" | /bin/grep "^Installed"',
    timeout => 600 ,
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
    require  => Package['ruby-devel']
  }

}
