#!/usr/bin/env bash

if [ `psql --username postgres -d $POSTGRES_DB -c "SELECT extname from pg_extension;" | grep postgis | wc -l` != 0 ] ;then
  echo "Provisioning already done..."
  exit
fi

echo "Enable Postgis support"
psql --username postgres -d $POSTGRES_DB -c "CREATE EXTENSION postgis;"
