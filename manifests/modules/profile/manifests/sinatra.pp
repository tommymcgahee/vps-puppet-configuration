class profile::sinatra {

  package { 'ruby-devel':
    provider => 'yum',
    ensure   => 'installed',
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
    require  => Package['ruby_devel']
  }

}
