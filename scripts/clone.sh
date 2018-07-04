#!/usr/bin/env bash
# Clone all the Big Neon repositories
default_repos="bn-db bn-api bn-android bn-web bn-ios docs"
repos=$1
repos=${repos:-$default_repos}
cd ..
for repo in $repos; do
    git clone git@github.com:big-neon/${repo}.git
done
cd bigneon
echo Done
