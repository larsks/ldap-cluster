class role::webserver {
  include avahi

  avahi::service { 'webserver':
    service_type => '_http._tcp',
    service_port => 80,
  }
}

