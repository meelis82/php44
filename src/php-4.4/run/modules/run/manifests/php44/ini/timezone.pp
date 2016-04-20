class run::php44::ini::timezone {
  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/timezone.ini':
    ensure => present,
    content => template('run/php44/ini/timezone.ini.erb'),
    mode => 644
  }
}
