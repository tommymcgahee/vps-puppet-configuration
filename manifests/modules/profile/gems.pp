class profile::gems {

  package { 'sinatra':
    provider => 'gem',
    alias    => 'ruby-sinatras',
    ensure   => 'installed'
  }

  package { 'thin':
    provider => 'gem',
    alias    => 'ruby-thin',
    ensure   => 'installed'
  }

}
