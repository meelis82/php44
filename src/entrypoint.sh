#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/php-4.4/build.sh && /src/php-4.4/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/php-4.4/variables.sh && /bin/su - www-data -mc \"/src/php-4.4/run.sh\""
    ;;
esac
