class build::phppdf {
  require build::php44

  file { '/tmp/PDFlib-Lite-7.0.5p3.tar.gz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/PDFlib-Lite-7.0.5p3.tar.gz'
  }

  file { '/tmp/pdflib-2.1.10.tgz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/pdflib-2.1.10.tgz'
  }

  bash_exec { 'cd /tmp && tar xzf PDFlib-Lite-7.0.5p3.tar.gz':
    require => File['/tmp/PDFlib-Lite-7.0.5p3.tar.gz']
  }

  bash_exec { 'cd /tmp && tar xzf pdflib-2.1.10.tgz':
    require => File['/tmp/pdflib-2.1.10.tgz']
  }

  bash_exec { 'cd /tmp/PDFlib-Lite-7.0.5p3 && ./configure':
    require => Bash_exec['cd /tmp && tar xzf PDFlib-Lite-7.0.5p3.tar.gz']
  }

  bash_exec { 'cd /tmp/PDFlib-Lite-7.0.5p3 && make && make install':
    require => Bash_exec['cd /tmp/PDFlib-Lite-7.0.5p3 && ./configure']
  }

  bash_exec { 'cd /tmp/pdflib-2.1.10 && /usr/local/src/phpfarm/inst/current/bin/phpize':
    require => [ Bash_exec['cd /tmp && tar xzf pdflib-2.1.10.tgz'], Bash_exec['cd /tmp/PDFlib-Lite-7.0.5p3 && make && make install'] ]
  }

  bash_exec { 'cd /tmp/pdflib-2.1.10 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/php-4.4.9/bin/php-config':
    require => Bash_exec['cd /tmp/pdflib-2.1.10 && /usr/local/src/phpfarm/inst/current/bin/phpize']
  }

  bash_exec { 'cd /tmp/pdflib-2.1.10 && make && make install':
    require => Bash_exec['cd /tmp/pdflib-2.1.10 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/php-4.4.9/bin/php-config']
  }

  bash_exec { 'mv -f /tmp/pdflib-2.1.10/modules/pdf.so /usr/local/src/phpfarm/inst/php-4.4.9/lib/php/extensions/no-debug-non-zts-20090626/':
   require => Bash_exec['cd /tmp/pdflib-2.1.10 && make && make install'],
  }
}
