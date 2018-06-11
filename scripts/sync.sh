#!/bin/bash
# Pull all the Big Neon repositories
default_repos="bn-db bn-api bn-android bn-web bn-ios docs"
repos=$1
repos=${repos:-$default_repos}
cd ..

for repo in $repos; do
    echo
    echo Syncing $repo...
    cd $repo
    git pull origin
    cd ..
done
cd bigneon
echo Done