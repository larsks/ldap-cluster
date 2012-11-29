class role::ldapserver {
  include avahi
  include ldap::server

  avahi::service { 'ldap':
    service_type => '_ldap._tcp',
    service_port => '389',
  }
}

