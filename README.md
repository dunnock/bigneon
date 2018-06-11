# bigneon
Meta-Project for building the Big Neon system locally

# Installation

First clone this repo

       git clone https://github.com/big-neon/bigneon.git
       cd bigneon

# Usage

## Clone all the repositories

Copy all the source code from github to your local machine. This will install all the projects in sibling
folders to the `bigneon` repo on your machine  

    make init
    
## List branches

Print the current branch for each repo to the console

    make status

## Synchronise your code

To periodically download all software updates and synchronise with github run

    make sync
    
**NB:** This script runs `git pull origin`, so if you want the latest `master` branch, make sure each repo
has the master branch checked out

## Build docker images

Rebuild all docker images locally

    make build
    