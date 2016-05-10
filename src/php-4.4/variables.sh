#!/usr/bin/env bash

if [ -z "${SERVER_NAME}" ]; then
  SERVER_NAME="localhost"
fi

export FACTER_SERVER_NAME="${SERVER_NAME}"

if [ -z "${TIMEZONE}" ]; then
  TIMEZONE="Etc/UTC"
fi

export FACTER_TIMEZONE="${TIMEZONE}"

if [ -n "${SMTP_HOST}" ]; then
  export FACTER_SMTP_HOST="${SMTP_HOST}"

  if [ -z "${SMTP_PORT}" ]; then
    SMTP_PORT="25"
  fi

  export FACTER_SMTP_PORT="${SMTP_PORT}"
else
  SMTP_PORT="$(echo "${SMTP_PORT}" | sed 's/tcp:\/\///')"

  export FACTER_SMTP_HOST="$(echo "${SMTP_PORT}" | cut -d ":" -f1)"
  export FACTER_SMTP_PORT="$(echo "${SMTP_PORT}" | cut -d ":" -f2)"
fi

if [ -n "${MYSQL_HOST}" ]; then
  export FACTER_MYSQL_HOST="${MYSQL_HOST}"

  if [ -z "${MYSQL_PORT}" ]; then
    MYSQL_PORT="3306"
  fi

  export FACTER_MYSQL_PORT="${MYSQL_PORT}"
else
  MYSQL_PORT="$(echo "${MYSQL_PORT}" | sed 's/tcp:\/\///')"

  export FACTER_MYSQL_HOST="$(echo "${MYSQL_PORT}" | cut -d ":" -f1)"
  export FACTER_MYSQL_PORT="$(echo "${MYSQL_PORT}" | cut -d ":" -f2)"
fi

if [ -n "${MEMCACHED_HOST}" ]; then
  export FACTER_MEMCACHED_HOST="${MEMCACHED_HOST}"

  if [ -z "${MEMCACHED_PORT}" ]; then
    MEMCACHED_PORT="11211"
  fi

  export FACTER_MEMCACHED_PORT="${MEMCACHED_PORT}"
else
  MEMCACHED_PORT="$(echo "${MEMCACHED_PORT}" | sed 's/tcp:\/\///')"

  export FACTER_MEMCACHED_HOST="$(echo "${MEMCACHED_PORT}" | cut -d ":" -f1)"
  export FACTER_MEMCACHED_PORT="$(echo "${MEMCACHED_PORT}" | cut -d ":" -f2)"
fi

if [ -n "${REDIS_HOST}" ]; then
  export FACTER_REDIS_HOST="${REDIS_HOST}"

  if [ -z "${REDIS_PORT}" ]; then
    REDIS_PORT="6379"
  fi

  export FACTER_REDIS_PORT="${REDIS_PORT}"
else
  REDIS_PORT="$(echo "${REDIS_PORT}" | sed 's/tcp:\/\///')"

  export FACTER_REDIS_HOST="$(echo "${REDIS_PORT}" | cut -d ":" -f1)"
  export FACTER_REDIS_PORT="$(echo "${REDIS_PORT}" | cut -d ":" -f2)"
fi

if [ -z "${USER_ID}" ]; then
  USER_ID=$(id www-data -u)
fi

export FACTER_USER_ID="${USER_ID}"

if [ -z "${GROUP_ID}" ]; then
  GROUP_ID=$(id www-data -g)
fi

export FACTER_GROUP_ID="${GROUP_ID}"

if [ -z "${DRUPAL_VERSION}" ]; then
  DRUPAL_VERSION="7"
fi

export FACTER_DRUPAL_VERSION="${DRUPAL_VERSION}"

if [ -z "${DRUSH_VERSION}" ]; then
  DRUSH_VERSION="7"
fi

export FACTER_DRUSH_VERSION="${DRUSH_VERSION}"

if [ -z "${PHP_INI_REALPATH_CACHE_SIZE}" ]; then
  PHP_INI_REALPATH_CACHE_SIZE="256k"
fi

export FACTER_PHP_INI_REALPATH_CACHE_SIZE="${PHP_INI_REALPATH_CACHE_SIZE}"

if [ -z "${PHP_INI_REALPATH_CACHE_TTL}" ]; then
  PHP_INI_REALPATH_CACHE_TTL="3600"
fi

export FACTER_PHP_INI_REALPATH_CACHE_TTL="${PHP_INI_REALPATH_CACHE_TTL}"

if [ -z "${PHP_INI_POST_MAX_SIZE}" ]; then
  PHP_INI_POST_MAX_SIZE="512M"
fi

export FACTER_PHP_INI_POST_MAX_SIZE="${PHP_INI_POST_MAX_SIZE}"

if [ -z "${PHP_INI_TIMEZONE}" ]; then
  PHP_INI_TIMEZONE="UTC"
fi

export FACTER_PHP_INI_TIMEZONE="${PHP_INI_TIMEZONE}"

if [ -z "${PHP_INI_UPLOAD_MAX_FILESIZE}" ]; then
  PHP_INI_UPLOAD_MAX_FILESIZE="512M"
fi

export FACTER_PHP_INI_UPLOAD_MAX_FILESIZE="${PHP_INI_UPLOAD_MAX_FILESIZE}"

if [ -z "${PHP_INI_SHORT_OPEN_TAG}" ]; then
  PHP_INI_SHORT_OPEN_TAG="On"
fi

export FACTER_PHP_INI_SHORT_OPEN_TAG="${PHP_INI_SHORT_OPEN_TAG}"

if [ -z "${PHP_INI_MAX_EXECUTION_TIME}" ]; then
  PHP_INI_MAX_EXECUTION_TIME="300"
fi

export FACTER_PHP_INI_MAX_EXECUTION_TIME="${PHP_INI_MAX_EXECUTION_TIME}"

if [ -z "${PHP_INI_MAX_INPUT_VARS}" ]; then
  PHP_INI_MAX_INPUT_VARS="4096"
fi

export FACTER_PHP_INI_MAX_INPUT_VARS="${PHP_INI_MAX_INPUT_VARS}"

if [ -z "${PHP_INI_MEMORY_LIMIT}" ]; then
  PHP_INI_MEMORY_LIMIT="512M"
fi

export FACTER_PHP_INI_MEMORY_LIMIT="${PHP_INI_MEMORY_LIMIT}"

if [ -z "${PHP_INI_DISPLAY_ERRORS}" ]; then
  PHP_INI_DISPLAY_ERRORS="On"
fi

export FACTER_PHP_INI_DISPLAY_ERRORS="${PHP_INI_DISPLAY_ERRORS}"

if [ -z "${PHP_INI_DISPLAY_STARTUP_ERRORS}" ]; then
  PHP_INI_DISPLAY_STARTUP_ERRORS="On"
fi

export FACTER_PHP_INI_DISPLAY_STARTUP_ERRORS="${PHP_INI_DISPLAY_STARTUP_ERRORS}"

if [ -z "${PHP_INI_ERROR_REPORTING}" ]; then
  PHP_INI_ERROR_REPORTING="E_ALL"
fi

export FACTER_PHP_INI_ERROR_REPORTING="${PHP_INI_ERROR_REPORTING}"

if [ -z "${PHP_INI_EXPOSE_PHP}" ]; then
  PHP_INI_EXPOSE_PHP="On"
fi

export FACTER_PHP_INI_EXPOSE_PHP="${PHP_INI_EXPOSE_PHP}"

if [ -z "${PHP_INI_ALLOW_URL_FOPEN}" ]; then
  PHP_INI_ALLOW_URL_FOPEN="On"
fi

export FACTER_PHP_INI_ALLOW_URL_FOPEN="${PHP_INI_ALLOW_URL_FOPEN}"

if [ -z "${PHP_INI_OPCACHE}" ]; then
  PHP_INI_OPCACHE="On"
fi

export FACTER_PHP_INI_OPCACHE="${PHP_INI_OPCACHE}"

if [ -z "${PHP_INI_OPCACHE_MEMORY_CONSUMPTION}" ]; then
  PHP_INI_OPCACHE_MEMORY_CONSUMPTION="2048"
fi

export FACTER_PHP_INI_OPCACHE_MEMORY_CONSUMPTION="${PHP_INI_OPCACHE_MEMORY_CONSUMPTION}"

if [ -z "${PHP_INI_XDEBUG}" ]; then
  PHP_INI_XDEBUG="On"
fi

export FACTER_PHP_INI_XDEBUG="${PHP_INI_XDEBUG}"

if [ -z "${PHP_INI_XDEBUG_REMOTE_PORT}" ]; then
  PHP_INI_XDEBUG_REMOTE_PORT="9000"
fi

export FACTER_PHP_INI_XDEBUG_REMOTE_PORT="${PHP_INI_XDEBUG_REMOTE_PORT}"

if [ -z "${PHP_INI_XDEBUG_REMOTE_HOST}" ]; then
  PHP_INI_XDEBUG_REMOTE_HOST="127.0.0.1"
fi

export FACTER_PHP_INI_XDEBUG_REMOTE_HOST="${PHP_INI_XDEBUG_REMOTE_HOST}"

if [ -z "${PHP_INI_XDEBUG_REMOTE_CONNECT_BACK}" ]; then
  PHP_INI_XDEBUG_REMOTE_CONNECT_BACK="On"
fi

export FACTER_PHP_INI_XDEBUG_REMOTE_CONNECT_BACK="${PHP_INI_XDEBUG_REMOTE_CONNECT_BACK}"

if [ -z "${PHP_INI_XDEBUG_IDEKEY}" ]; then
  PHP_INI_XDEBUG_IDEKEY="PHPSTORM"
fi

export FACTER_PHP_INI_XDEBUG_IDEKEY="${PHP_INI_XDEBUG_IDEKEY}"

if [ -z "${PHP_INI_XDEBUG_VAR_DISPLAY_MAX_DEPTH}" ]; then
  PHP_INI_XDEBUG_VAR_DISPLAY_MAX_DEPTH="3"
fi

export FACTER_PHP_INI_XDEBUG_VAR_DISPLAY_MAX_DEPTH="${PHP_INI_XDEBUG_VAR_DISPLAY_MAX_DEPTH}"

if [ -z "${PHP_INI_MEMCACHED}" ]; then
  PHP_INI_MEMCACHED="On"
fi

export FACTER_PHP_INI_MEMCACHED="${PHP_INI_MEMCACHED}"

if [ -z "${PHP_INI_SENDMAIL_PATH}" ]; then
  PHP_INI_SENDMAIL_PATH="/usr/sbin/sendmail -t -i"
fi

export FACTER_PHP_INI_SENDMAIL_PATH="${PHP_INI_SENDMAIL_PATH}"

if [ -z "${PHP_INI_REDIS}" ]; then
  PHP_INI_REDIS="On"
fi

export FACTER_PHP_INI_REDIS="${PHP_INI_REDIS}"

if [ -z "${PHP_INI_BLACKFIRE}" ]; then
  PHP_INI_BLACKFIRE="On"
fi

export FACTER_PHP_INI_BLACKFIRE="${PHP_INI_BLACKFIRE}"

if [ -z "${PHP_INI_BLACKFIRE_SERVER_ID}" ]; then
  PHP_INI_BLACKFIRE_SERVER_ID=""
fi

export FACTER_PHP_INI_BLACKFIRE_SERVER_ID="${PHP_INI_BLACKFIRE_SERVER_ID}"

if [ -z "${PHP_INI_BLACKFIRE_SERVER_TOKEN}" ]; then
  PHP_INI_BLACKFIRE_SERVER_TOKEN=""
fi

export FACTER_PHP_INI_BLACKFIRE_SERVER_TOKEN="${PHP_INI_BLACKFIRE_SERVER_TOKEN}"

if [ -z "${PHP_INI_APCU}" ]; then
  PHP_INI_APCU="On"
fi

export FACTER_PHP_INI_APCU="${PHP_INI_APCU}"

if [ -z "${PHP_INI_APD}" ]; then
  PHP_INI_APD="On"
fi

export FACTER_PHP_INI_APD="${PHP_INI_APD}"

if [ -z "${PHP_FPM_PM}" ]; then
  PHP_FPM_PM="dynamic"
fi

export FACTER_PHP_FPM_PM="${PHP_FPM_PM}"

if [ -z "${PHP_FPM_PM_MAX_CHILDREN}" ]; then
  PHP_FPM_PM_MAX_CHILDREN="5"
fi

export FACTER_PHP_FPM_PM_MAX_CHILDREN="${PHP_FPM_PM_MAX_CHILDREN}"

if [ -z "${PHP_FPM_PM_START_SERVERS}" ]; then
  PHP_FPM_PM_START_SERVERS="2"
fi

export FACTER_PHP_FPM_PM_START_SERVERS="${PHP_FPM_PM_START_SERVERS}"

if [ -z "${PHP_FPM_PM_MIN_SPARE_SERVERS}" ]; then
  PHP_FPM_PM_MIN_SPARE_SERVERS="1"
fi

export FACTER_PHP_FPM_PM_MIN_SPARE_SERVERS="${PHP_FPM_PM_MIN_SPARE_SERVERS}"

if [ -z "${PHP_FPM_PM_MAX_SPARE_SERVERS}" ]; then
  PHP_FPM_PM_MAX_SPARE_SERVERS="3"
fi

export FACTER_PHP_FPM_PM_MAX_SPARE_SERVERS="${PHP_FPM_PM_MAX_SPARE_SERVERS}"

if [ -z "${PHP_FPM_PM_PROCESS_IDLE_TIMEOUT}" ]; then
  PHP_FPM_PM_PROCESS_IDLE_TIMEOUT="10s"
fi

export FACTER_PHP_FPM_PM_PROCESS_IDLE_TIMEOUT="${PHP_FPM_PM_PROCESS_IDLE_TIMEOUT}"

if [ -z "${PHP_FPM_PM_MAX_REQUESTS}" ]; then
  PHP_FPM_PM_MAX_REQUESTS="0"
fi

export FACTER_PHP_FPM_PM_MAX_REQUESTS="${PHP_FPM_PM_MAX_REQUESTS}"

for VARIABLE in $(env); do
  if [[ "${VARIABLE}" =~ ^CRONTAB_[[:digit:]]+_EXPRESSION=.*$ ]]; then
    i="$(echo ${VARIABLE} | awk -F '_' '{ print $2 }')"

    CRONTAB_MAILTO="CRONTAB_${i}_MAILTO"
    CRONTAB_EXPRESSION="CRONTAB_${i}_EXPRESSION"
    CRONTAB_COMMAND="CRONTAB_${i}_COMMAND"

    if [ -z "${!CRONTAB_EXPRESSION}" ]; then
      continue
    fi

    if [ -z "${!CRONTAB_COMMAND}" ]; then
      continue
    fi

    export "FACTER_${CRONTAB_MAILTO}=${!CRONTAB_MAILTO}"
    export "FACTER_${CRONTAB_EXPRESSION}=${!CRONTAB_EXPRESSION}"
    export "FACTER_${CRONTAB_COMMAND}=${!CRONTAB_COMMAND}"
  fi
done

for VARIABLE in $(env); do
  if [[ "${VARIABLE}" =~ ^FREETDS_[[:digit:]]+_HOST=.*$ ]]; then
    i="$(echo ${VARIABLE} | awk -F '_' '{ print $2 }')"

    FREETDS_HOST="FREETDS_${i}_HOST"
    FREETDS_PORT="FREETDS_${i}_PORT"
    FREETDS_TDS_VERSION="FREETDS_${i}_TDS_VERSION"
    FREETDS_SERVER_NAME="FREETDS_${i}_SERVER_NAME"
    FREETDS_CLIENT_CHARSET="FREETDS_${i}_CLIENT_CHARSET"

    if [ -z "${!FREETDS_HOST}" ]; then
      continue
    fi

    if [ -z "${!FREETDS_PORT}" ]; then
      declare "${FREETDS_PORT}=1433"
    fi

    if [ -z "${!FREETDS_TDS_VERSION}" ]; then
      declare "${FREETDS_TDS_VERSION}=8.0"
    fi

    if [ -z "${!FREETDS_SERVER_NAME}" ]; then
      declare "${FREETDS_SERVER_NAME}=server-${i}"
    fi

    if [ -z "${!FREETDS_SERVER_NAME}" ]; then
      declare "${FREETDS_CLIENT_CHARSET}=UTF-8"
    fi

    export "FACTER_${FREETDS_HOST}=${!FREETDS_HOST}"
    export "FACTER_${FREETDS_PORT}=${!FREETDS_PORT}"
    export "FACTER_${FREETDS_TDS_VERSION}=${!FREETDS_TDS_VERSION}"
    export "FACTER_${FREETDS_SERVER_NAME}=${!FREETDS_SERVER_NAME}"
    export "FACTER_${FREETDS_CLIENT_CHARSET}=${!FREETDS_CLIENT_CHARSET}"
  fi
done

if [ -z "${CRON}" ]; then
  CRON="On"
fi

export FACTER_CRON="${CRON}"
