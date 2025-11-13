class build::zend {
  require build::php44

  file { '/tmp/ZendOptimizer-3.3.9-linux-glibc23-x86_64.tar.gz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/ZendOptimizer-3.3.9-linux-glibc23-x86_64.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf ZendOptimizer-3.3.9-linux-glibc23-x86_64.tar.gz':
    require => File['/tmp/ZendOptimizer-3.3.9-linux-glibc23-x86_64.tar.gz']
  }
  
  bash_exec { 'mv -f /tmp/ZendOptimizer-3.3.9-linux-glibc23-x86_64/data/4_4_x_comp/ZendOptimizer.so /usr/local/src/phpfarm/inst/php-4.4.9/lib/php/extensions/no-debug-non-zts-20090626/':
   require => Bash_exec['cd /tmp && tar xzf ZendOptimizer-3.3.9-linux-glibc23-x86_64.tar.gz'],
  }
}

