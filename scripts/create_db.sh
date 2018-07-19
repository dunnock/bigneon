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

# This url is should point to localhost, since it's running from outside the docker network
DB_URL="postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@localhost:5432/$DBNAME"
# Make sure the database is running
docker-compose up -d pg

# check if diesel_cli has been installed and install if not
diesel -V 2> /dev/null || cargo install diesel_cli --no-default-features --features postgres
echo "Setting up $DB_URL from $BN_DB_PATH"
diesel setup --config-file "$BN_DB_PATH/diesel.toml" --database-url "$DB_URL" --migration-dir "$BN_DB_PATH/migrations"
[[ $1 == migrate ]] && diesel migration run --config-file "$BN_DB_PATH/diesel.toml" --database-url "$DB_URL" --migration-dir "$BN_DB_PATH/migrations"