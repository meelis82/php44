class run::php44::ini::sendmail_from {
  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/sendmail_from.ini':
    ensure => present,
    content => template('run/php44/ini/sendmail_from.ini.erb'),
    mode => 644
  }
}
