node default {
  class { '::chrony':
    servers => [ '0.north-america.pool.ntp.org','1.north-america.pool.ntp.org','2.north-america.pool.ntp.org','3.north-america.pool.ntp.org'],
  }

  class { 'apache':
    default_vhost => false,
    # vhosts defined in %{environment}/data/common.yaml
    # Create a hash from Hiera Data with the Vhosts
    $myApacheVhosts => hiera('apache::vhost', {})

    # With Create Resource Converts a hash into a set of resources
    create_resources('apache::vhost', $myApacheVhosts)
  }
}
