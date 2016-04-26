class build::php44::packages {
  package {[
      'build-essential',
      'libxml2-dev',
      'libssl-dev',
      'libbz2-dev',
      'libcurl4-openssl-dev',
      'libfreetype6-dev',
      'libjpeg-dev',
      'libpng12-dev',
      'libmcrypt-dev',
      'libmhash-dev',
      'libmysqlclient-dev',
      'libpspell-dev',
      'autoconf',
      'libcloog-ppl0',
      'libsasl2-dev',
      'libldap2-dev',
      'pkg-config',
      'libreadline-dev',
      'libltdl-dev',
      'imagemagick',
      'zip'
    ]:
    ensure => present
  }
}
