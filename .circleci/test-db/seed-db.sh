#!/bin/bash
 
###################################################
# Bash script to create database and seed 
###################################################

# Variable Definitions
# Path to directory bash script is living
DIR=".circleci/test-db"

# Database Variable Definitions
DATABASE="sl_pg"
USER="test"

# Output Filename for Faker File
FILEPATH="${DIR}/db-seed.csv"
# if parameter 1 is not passed as argument default records to be generated to 1000000
LINES=${1:-10}

### Import Our Database ###
# Dont specify a database since CREATE DATABASE is in schema.sql
SCHEMA="$DIR/schema.sql"
psql -U $USER < $SCHEMA

### Run Our Generator Script ###
node generator.js --output=$FILEPATH --lines=$LINES

### Import Our posts.csv file to seed Database ###
psql -U $USER -d $DATABASE -c "COPY $DATABASE FROM '$FILEPATH' CSV HEADER;
