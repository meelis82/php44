class build::php44 {
  require build::php44::packages
  require build::php44::supervisor
  require build::php44::logs
  require build::phpfarm

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-4.4.9/etc/conf.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-4.4.9/etc/fpm.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-4.4.9/etc/pool.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-4.4.9/lib/php/extensions/no-debug-non-zts-20090626': }

  file { '/tmp/php-4.4.9.tar.gz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/php-4.4.9.tar.gz'
  }

  file { '/tmp/flex-old_2.5.4a-10ubuntu1_amd64.deb':
    ensure => present,
    source => 'puppet:///modules/build/tmp/flex-old_2.5.4a-10ubuntu1_amd64.deb'
  }

  file { '/usr/lib/libjpeg.so':
    ensure => 'link',
    target => '/usr/lib/x86_64-linux-gnu/libjpeg.so',
    force => true,
  }

  file { '/usr/lib/libpng.so':
    ensure => 'link',
    target => '/usr/lib/x86_64-linux-gnu/libpng.so',
    force => true,
  }

  bash_exec { 'cd /tmp && tar xzf php-4.4.9.tar.gz':
    require => File['/tmp/php-4.4.9.tar.gz']
  }



  bash_exec { 'dpkg -i /tmp/flex-old_2.5.4a-10ubuntu1_amd64.deb':
    require => File['/tmp/flex-old_2.5.4a-10ubuntu1_amd64.deb']
  }

  bash_exec { 'cp -r /tmp/php-4.4.9 /usr/local/src/phpfarm/src/php-4.4.9':
    require => Bash_exec['cd /tmp && tar xzf php-4.4.9.tar.gz']
  }

  file { '/tmp/default-custom-php.ini':
    ensure => present,
    source => 'puppet:///modules/build/tmp/default-custom-php.ini',
  }
  
  bash_exec { ' rm -f /usr/local/src/phpfarm/src/default-custom-php.ini && mv /tmp/default-custom-php.ini /usr/local/src/phpfarm/src/default-custom-php.ini':
	require => [
		File['/tmp/default-custom-php.ini'],
		Bash_exec['cp -r /tmp/php-4.4.9 /usr/local/src/phpfarm/src/php-4.4.9'],
    	]
  } 

  file { '/tmp/opensslc':
    ensure => present,
    source => 'puppet:///modules/build/tmp/opensslc',
  }

  file { '/usr/local/src/phpfarm/inst/php-4.4.9/etc/conf.d/inf-php.ini':
    ensure => present,
    source => 'puppet:///modules/build/tmp/inf-custom.php.ini',
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 4.4.9'],
  }

  bash_exec { 'mv -f /tmp/opensslc /usr/local/src/phpfarm/src/php-4.4.9/ext/openssl/openssl.c':
  	require => [
		File['/tmp/opensslc'],
		Bash_exec['cp -r /tmp/php-4.4.9 /usr/local/src/phpfarm/src/php-4.4.9'],
	]
  }

  file { '/usr/local/src/phpfarm/src/custom/options-4.4.9.sh':
    ensure => present,
    source => 'puppet:///modules/build/usr/local/src/phpfarm/src/custom/options-4.4.9.sh',
    mode => 755,
    require => Bash_exec['cp -r /tmp/php-4.4.9 /usr/local/src/phpfarm/src/php-4.4.9']
  }

  file { '/usr/local/src/phpfarm/src/compile.sh':
    ensure => present,
    source => 'puppet:///modules/build/tmp/compile.sh',
    replace => true,
    mode => 755,
    require => Bash_exec['cp -r /tmp/php-4.4.9 /usr/local/src/phpfarm/src/php-4.4.9']
  }

  bash_exec { '/usr/local/src/phpfarm/src/main.sh 4.4.9':
    timeout => 0,
    require => [
	Bash_exec['dpkg -i /tmp/flex-old_2.5.4a-10ubuntu1_amd64.deb'],
	File['/usr/local/src/phpfarm/src/custom/options-4.4.9.sh'],
	File['/usr/lib/libjpeg.so'], File['/usr/lib/libpng.so'],
	File['/usr/local/src/phpfarm/src/compile.sh'],
	Bash_exec['mv -f /tmp/opensslc /usr/local/src/phpfarm/src/php-4.4.9/ext/openssl/openssl.c'],
    ]
  }

  bash_exec { 'rm -r /usr/local/src/phpfarm/src/php-4.4.9':
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 4.4.9']
  }
}
