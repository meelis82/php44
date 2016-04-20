class run::php44 {
  file { '/usr/local/src/phpfarm/inst/current/etc/pool.d/www.conf':
    ensure => present,
    content => template('run/www.conf.erb'),
    mode => 644
  }

  include run::php44::ini::realpath_cache_size
  include run::php44::ini::realpath_cache_ttl
  include run::php44::ini::timezone
  include run::php44::ini::post_max_size
  include run::php44::ini::upload_max_filesize
  include run::php44::ini::short_open_tag
  include run::php44::ini::max_execution_time
  include run::php44::ini::max_input_vars
  include run::php44::ini::memory_limit
  include run::php44::ini::display_errors
  include run::php44::ini::display_startup_errors
  include run::php44::ini::error_reporting
  include run::php44::ini::expose_php
  include run::php44::ini::allow_url_fopen
  include run::php44::ini::zend

  if $php_ini_xdebug == "On" {
    include run::php44::ini::xdebug
  }

  if $php_ini_apcu == "On" {
    include run::php44::ini::apcu
  }

  if $php_ini_apd == "On" {
    include run::php44::ini::apd
  }
}
