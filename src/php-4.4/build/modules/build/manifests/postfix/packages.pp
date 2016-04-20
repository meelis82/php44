class build::postfix::packages {
  package {[
      'postfix',
      'mailutils',
      'bison'
    ]:
    ensure => present
  }
}
