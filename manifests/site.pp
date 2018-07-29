node default {
  include profile::chrony
  include profile::apache
  include profile::sinatra
}
