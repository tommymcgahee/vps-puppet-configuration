class { 'profile::chrony':

  class { '::chrony':
    servers => lookup('chrony::servers', {merge => unique})
  }

}
