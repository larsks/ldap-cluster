class ldap::server {
  include ldap

  $packages = [ 'slapd' ]

  packages { $packages:
    ensure => installed,
  }

  service { 'slapd':
    ensure => running,
    enable => true,
  }

}

