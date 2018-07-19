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
    
## Create or update the database table definitions

Pre-requisites:

* You need Postgres running (this guide assumes you're running a docker container):
        `docker-compose up db`
* Configure your `.env` file (or set environment variables specifically) with the database connection and
  `bn-db` repo location. See `.env.sample` for the list of envars that can be set.

Then to create the database for the first time, run

    make create-db
  
After this, to update the database with the latest migrations, run

    make migrate-db
    