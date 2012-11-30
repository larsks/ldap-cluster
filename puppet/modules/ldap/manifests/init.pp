class ldap {
  $packages = [
    'ldap-utils',
    'ldapvi',
  ]

  package { $packages:
    ensure => installed,
  }
}

