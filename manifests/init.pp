class locale (
  $locales
) {

  Exec {
    path => ['/usr/sbin', '/bin', '/usr/bin']
  }

  exec { 'install_locales':
    command => "locale-gen ${locales}",
  }

  exec { 'reload_locales':
    command => "locale-gen",
    require => Exec['install_locales']
  }
}

