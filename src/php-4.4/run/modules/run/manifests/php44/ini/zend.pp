class run::php44::ini::zend {
  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/zend.ini':
    ensure => present,
    content => template('run/php44/ini/zend.ini.erb'),
    mode => 644
  }
}
