class apache {
  $packages = [ 'apache2' ]

  packages { $packages:
    ensure => installed,
  }

  service { 'apache2':
    ensure => running,
    enable => true,
  }
}

