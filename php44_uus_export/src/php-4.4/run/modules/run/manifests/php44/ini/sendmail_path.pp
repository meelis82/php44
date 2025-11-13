class run::php44::ini::sendmail_path {
  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/sendmail_path.ini':
    ensure => present,
    content => template('run/php44/ini/sendmail_path.ini.erb'),
    mode => 644
  }
}
