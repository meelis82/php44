class build {
  require build::user

  include build::php44
  include build::php44::extensions
  include build::zend
  include build::postfix
  include build::cron
}
