#!/usr/bin/env bash

puppet apply --modulepath=/src/php-4.4/run/modules /src/php-4.4/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf
