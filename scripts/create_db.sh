#!/usr/bin/env bash

function check_envar {
    if [ -z "$2" ]; then
      echo "$1 must be set in your .env file or environment variables"
      exit 1
    fi
}
# Load envars from .env
source .env > /dev/null
# Check for required envars
check_envar "POSTGRES_USER" $POSTGRES_USER
check_envar "POSTGRES_PASSWORD" $POSTGRES_PASSWORD
check_envar "DBNAME" $DBNAME
check_envar "BN_DB_PATH" $BN_DB_PATH
check_envar "SUPERUSER_EMAIL" $SUPERUSER_EMAIL
check_envar "SUPERUSER_PASSWORD" $SUPERUSER_PASSWORD
check_envar "SUPERUSER_MOBILE" $SUPERUSER_MOBILE


# This url is should point to localhost, since it's running from outside the docker network
DB_URL="postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@localhost:5432/$DBNAME"
# Make sure the database is running
docker-compose up -d pg

echo "Setting up $DB_URL via bndb-cli"
if [[ ! -d $BN_DB_PATH ]]; then 
  echo "bn-db not found, cloning to $BN_DB_PATH"
  ./scripts/clone.sh bn-db
fi
cargo install --path $BN_DB_PATH --force
if [ "$1" == "migrate" ]; then 
  bndb_cli migrate -c $DB_URL
else
  bndb_cli create -c $DB_URL -e $SUPERUSER_EMAIL -p $SUPERUSER_PASSWORD -m $SUPERUSER_MOBILE
fi