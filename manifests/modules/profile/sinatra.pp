class profile::sinatra {

  package { 'sinatra':
    provider => 'gem',
    alias    => 'ruby-sinatra',
    ensure   => 'installed'
  }

  package { 'thin':
    provider => 'gem',
    alias    => 'ruby-thin',
    ensure   => 'installed',
    require  => Class['profile::dev_tools']
  }

}
