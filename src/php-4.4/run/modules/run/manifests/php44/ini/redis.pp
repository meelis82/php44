class run::php44::ini::redis {
  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/redis.ini':
    ensure => present,
    content => template('run/php44/ini/redis.ini.erb'),
    mode => 644
  }
}
