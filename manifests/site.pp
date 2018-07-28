node default {
  class { '::chrony':
    servers => [ '0.north-america.pool.ntp.org','1.north-america.pool.ntp.org','2.north-america.pool.ntp.org','3.north-america.pool.ntp.org'],
  }

  service { 'chronyd':
    enable => true
  }

  class { 'apache':
    default_vhost => false,
    # vhosts defined in %{environment}/data/common.yaml
  }
}
