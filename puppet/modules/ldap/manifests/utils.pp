class ldap::utils {
  $packages = [
    'ldap-utils',
    'ldapvi',
  ]

  package { $packages:
    ensure => installed,
  }
}

