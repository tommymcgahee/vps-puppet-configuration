class profile::sinatra {

  package { 'sinatra':
    provider => 'gem',
    alias    => 'ruby-sinatra',
    ensure   => 'installed'
  }

  require profile::dev_tools

  package { 'thin':
    provider => 'gem',
    alias    => 'ruby-thin',
    ensure   => 'installed',
    require  => Package['ruby_devel']
  }

}
