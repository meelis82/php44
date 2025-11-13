#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && apt-get install -y wget ca-certificates lsb-release gnupg && \
    CODENAME=\$(lsb_release -cs) && \
    wget https://apt.puppet.com/puppet7-release-\${CODENAME}.deb && \
    dpkg -i puppet7-release-\${CODENAME}.deb && \
    apt-get update && \
    apt-get install -y puppet-agent && \
    ln -s /opt/puppetlabs/bin/puppet /usr/bin/puppet && \
    /src/php-4.4/build.sh && /src/php-4.4/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/php-4.4/variables.sh && /src/php-4.4/run.sh"
    ;;
esac
