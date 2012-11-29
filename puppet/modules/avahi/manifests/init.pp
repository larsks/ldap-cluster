class avahi {
  $packages = [
    'avahi-daemon',
    'avahi-utils',
  ]

  package { $packages:
    ensure => installed,
  }

  service { 'avahi-daemon':
    ensure => running,
    enable => true,
  }

  define service (
    $service_type,
    $service_port,
    $ensure = "present"
  ) {
    $service_name = $name

    file { "/etc/avahi/services/${service_name}.service":
      ensure  => $ensure,
      content => template('avahi/avahi.service'),
      mode    => 0644,
    }
  }
}

