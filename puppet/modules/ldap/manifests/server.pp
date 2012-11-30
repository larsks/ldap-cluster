class ldap::server {
  include ldap

  $packages = [ 'slapd' ]

  package { $packages:
    ensure => installed,
  }

  service { 'slapd':
    ensure => running,
    enable => true,
  }

}

