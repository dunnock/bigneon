#!/bin/bash
# Do something on each repo
default_repos="bn-db bn-api bn-android bn-web bn-ios docs bn-api-node"
cmd=$1
repos=$2
repos=${repos:-$default_repos}
cd ..

for repo in $repos; do
    cd $repo
    echo $repo: `$cmd`
    cd ..
done
cd bigneon
