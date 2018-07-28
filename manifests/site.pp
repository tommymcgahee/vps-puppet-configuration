node default {
  class { '::chrony':
    servers => lookup('chrony::servers', {merge => unique})
  }

  include apache

}
