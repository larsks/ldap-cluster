class role::ldapserver {
  include avahi
  include ldap::server

  avahi::service { 'ldap':
    service_type => '_ldap._tcp',
    service_port => '389',
  }

  file { '/etc/ldap/data':
    ensure  => directory,
    source  => 'puppet:///modules/role/ldapserver/data',
    recurse => true,
  }

  file { '/var/lib/ldap/seas':
    ensure => directory,
    owner  => openldap,
    group  => openldap,
    mode   => 0700,
  }

  exec { 'initialize seas database':
    command => '/usr/bin/ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/data/db.ldif',
    creates => '/var/lib/ldap/seas/DB_CONFIG',
    require => [
      File['/etc/ldap/data'],
      File['/var/lib/ldap/seas'],
    ]
  }

  exec { 'create seas naming context':
    command => '/usr/bin/ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/data/namingcontext.ldif',
    require => Exec['initialize seas database'],
    unless  => '/usr/bin/ldapsearch -Y EXTERNAL -H ldapi:/// -b dc=seas,dc=harvard,dc=edu -s base',
  }
}

